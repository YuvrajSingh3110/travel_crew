import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> gender = ['Male', 'Female', 'Any'];
  List<String> budget = ['Low to High', 'High to Low'];
  List<String> teamStrength = ['<10', '>10', 'Partner'];

  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {  },
          backgroundColor: Colors.white,
          child: Icon(Icons.edit_outlined, color: Colors.blue,),
          elevation: 3,
        ),
        backgroundColor: Color(0xff282E38),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: 1000,
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff353943),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Where to?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                          Text(
                            "Choose yor dream trip destination",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //Dropdownmenu#4F4330
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //gender
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Gender',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        // dropdownItems: list1,
                        value: dropDownValue1,
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
                            dropDownValue1 = item as String;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff4F3238),
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: IconStyleData(
                          iconSize: 20,
                          iconDisabledColor: Colors.white70,
                          iconEnabledColor: Colors.white,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff4F3238),
                          ),
                          elevation: 8,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                    //budget
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Budget',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        // dropdownItems: list1,
                        value: dropDownValue2,
                        items: budget
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
                            dropDownValue2 = item as String;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff4F4330),
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: IconStyleData(
                          iconSize: 20,
                          iconDisabledColor: Colors.white70,
                          iconEnabledColor: Colors.white,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff4F4330),
                          ),
                          elevation: 8,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                    //no. of people
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'No. of People',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        // dropdownItems: list1,
                        value: dropDownValue3,
                        items: teamStrength
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
                            dropDownValue3 = item as String;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff2A4C3E),
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: IconStyleData(
                          iconSize: 20,
                          iconDisabledColor: Colors.white70,
                          iconEnabledColor: Colors.white,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff2A4C3E),
                          ),
                          elevation: 8,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "lib/assets/images/img.png",
                                    fit: BoxFit.cover,
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Manali, Himachal",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "₹10-15k",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  )
                                ],
                              ),
                              Container(
                                height: 35,
                                child: Row(
                                  children: [
                                    Text(
                                      '7-12 Jun',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff8E8E93)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    VerticalDivider(
                                      color: Color(0xff8E8E93),
                                      thickness: 1,
                                      width: 10,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Team Strength: 1',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff8E8E93)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    VerticalDivider(
                                      color: Color(0xff8E8E93),
                                      thickness: 1,
                                      width: 10,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Gender: Any',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff8E8E93)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
