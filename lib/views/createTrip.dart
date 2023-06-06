import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({Key? key}) : super(key: key);

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  TextEditingController _tripController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();
  TextEditingController _minBudgetController = new TextEditingController();
  TextEditingController _maxBudgetController = new TextEditingController();
  TextEditingController _minAgeController = new TextEditingController();
  TextEditingController _travelController = new TextEditingController();

  final List<String> gender = ['Male', 'Female', 'Any'];
  final List<String> Stay = [
    'Hotel',
    'Guest House',
    'Hostel',
    'Resort',
    'Camp',
    'Homestays'
  ];
  final List<String> Food = ['Veg', 'Non-Veg', 'Both Veg and Non-Veg'];
  final List<String> Language = [
    'English',
    'Hindi',
    'Punjabi',
    'Marathi',
    'Bengali',
    'Telugu',
    'Kannada',
    'Malayalam',
    'Tamil'
  ];
  final List<String> CostSplit = ['Yes', 'No'];
  final List<String> WorkWhileTravel = ['Yes', 'No'];

  String? dropDownValueGender;
  String? dropDownValueStay;
  String? dropDownValueFood;
  String? dropDownValueLang;
  String? dropDownValueCost;
  String? dropDownValueWork;

  String date = DateTime.now().toString();

  File? image;

  Future pickImage() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null)
        return;
      //final imageTemp = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print("Error in image picker $e");
    }
  }

  Future<File> saveImagePermanently(String imagePath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File("${directory.path}/$name");
    print(image);
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "Create Trip",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff3A3A3C),
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () async{
                      await pickImage();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: image != null ? Image.file(image!, height: 200,
                        width: MediaQuery.of(context).size.width, fit: BoxFit.cover,) : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload,
                            color: Colors.white,
                          ),
                          Text(
                            "Upload Image",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Trip Title",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff2C2C2E),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Expanded(
                    child: TextField(
                        controller: _tripController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            hintText: "Manali, Himachal",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Set Dates of Trip",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff2C2C2E),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: _dateController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: "23/11/2023-2/12/2023",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400))),
                      ),
                      InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            String formattedDate = DateFormat.yMMMd().format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(
                                formattedDate); //formatted date output using intl package =>  2022-07-04
                            setState(() {
                              date = formattedDate;
                              _dateController.text = date;
                              print("selected date is $date");
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("About Trip",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff2C2C2E),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Expanded(
                    child: TextField(
                        controller: _descController,
                        style: TextStyle(color: Colors.white),
                        maxLines: 8,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            hintText: "Describe the trip details",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //gender preferences
                          DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text("Gender",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            value: dropDownValueGender,
                            items: gender
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (item) {
                              setState(() {
                                dropDownValueGender = item as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff2C2C2E),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              iconSize: 20,
                              iconDisabledColor: Colors.white70,
                              iconEnabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2C2C2E),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                              elevation: 8,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          //Accommodation
                          DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text("Accommodation",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            value: dropDownValueStay,
                            items: Stay.map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )).toList(),
                            onChanged: (item) {
                              setState(() {
                                dropDownValueStay = item as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff2C2C2E),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              iconSize: 20,
                              iconDisabledColor: Colors.white70,
                              iconEnabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2C2C2E),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                              elevation: 8,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Food preferences
                          DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text("Food Preferred",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            value: dropDownValueFood,
                            items: Food.map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )).toList(),
                            onChanged: (item) {
                              setState(() {
                                dropDownValueFood = item as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff2C2C2E),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              iconSize: 20,
                              iconDisabledColor: Colors.white70,
                              iconEnabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2C2C2E),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                              elevation: 8,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          //Language
                          DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text("Language",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            value: dropDownValueLang,
                            items:
                                Language.map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )).toList(),
                            onChanged: (item) {
                              setState(() {
                                dropDownValueLang = item as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff2C2C2E),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              iconSize: 20,
                              iconDisabledColor: Colors.white70,
                              iconEnabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2C2C2E),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                              elevation: 8,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Food preferences
                          DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text("Cost Splits",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            value: dropDownValueCost,
                            items: CostSplit.map(
                                (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )).toList(),
                            onChanged: (item) {
                              setState(() {
                                dropDownValueCost = item as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff2C2C2E),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              iconSize: 20,
                              iconDisabledColor: Colors.white70,
                              iconEnabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2C2C2E),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                              elevation: 8,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          //Language
                          DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text("Work While Travelling",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            value: dropDownValueWork,
                            items: WorkWhileTravel.map(
                                (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )).toList(),
                            onChanged: (item) {
                              setState(() {
                                dropDownValueWork = item as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff2C2C2E),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              iconSize: 20,
                              iconDisabledColor: Colors.white70,
                              iconEnabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2C2C2E),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                              elevation: 8,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Max Estimated Budget",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xff2C2C2E),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white)),
                            child: Expanded(child: TextField(
                                controller: _maxBudgetController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "ex: ₹7000",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400))
                            )),
                          ),
                        ],
                      ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Min Estimated Budget",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: Color(0xff2C2C2E),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white)),
                            child: Expanded(child: TextField(
                                controller: _minBudgetController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "ex: ₹4000",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400))
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Min Age",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color(0xff2C2C2E),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white)),
                            child: Expanded(child: TextField(
                                controller: _minAgeController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "ex: 23",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400))
                            )),
                          ),
                        ],
                      ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type of Travel",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: Color(0xff2C2C2E),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white)),
                            child: Expanded(child: TextField(
                                controller: _travelController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "ex: Road Trip",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400))
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
