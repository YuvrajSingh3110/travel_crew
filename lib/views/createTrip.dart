import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({Key? key}) : super(key: key);

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  TextEditingController _tripController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();

  String date = DateTime.now().toString();

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
              children: [
                Container(
                  color: Color(0xff3A3A3C),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Row(
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Expanded(
                    child: TextField(
                        controller: _tripController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Manali, Himachal",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: _dateController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "23/11/2023-2/12/2023",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
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
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Expanded(
                    child: TextField(
                        controller: _descController,
                        style: TextStyle(color: Colors.white),
                        maxLines: 8,
                        decoration: InputDecoration(
                            hintText: "Describe the trip details",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400))),
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
