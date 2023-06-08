import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_crew/views/profile/profile_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _profileBloc = ProfileBloc();

  String name = "Prashant Prabhakar";
  String userId = "@prash2402";
  String email = "prashantp.cs.21@nitj.ac.in";
  String gender = "Male";
  String age = "22 Years";
  String phoneNumber = "79861231244";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocProvider(
          create: (context) {
            _profileBloc.add(GetProfileData());
            return _profileBloc;
          },
          child: BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) async {
                if(state is ProfileDataReceived){
                  setState(() {
                    name = state.name;
                    userId = state.userId;
                    email = state.email;
                    gender = state.gender;
                    age = state.age;
                    phoneNumber = state.phoneNumber;
                  });
                }else if(state is GetProfileDataFailed){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message))
                  );
                }
              },
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "My Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, (0.034557 * height), 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (0.058411 * width), 0, 0, 0),
                                  child: CircleAvatar(
                                    child:
                                        Image.asset("lib/assets/images/user.png"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (0.05841 * width), 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userId,
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ),
                                      Text(
                                        email,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  side: BorderSide(width: 2, color: Colors.blue)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, (0.04535 * height), 0, 0),
                        child: Card(
                          color: Color(0xFF2C2C2E),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                (0.05607 * width),
                                (0.0215 * height),
                                (0.05607 * width),
                                (0.03347 * height)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Items(
                                  icon: Icons.male,
                                  heading: "Gender",
                                  title: gender,
                                  color: Color(0xFFFD9426),
                                ),
                                Items(
                                  icon: Icons.cake,
                                  heading: "Age",
                                  color: Color(0xFF157EFA),
                                  title: age,
                                ),
                                Items(
                                  icon: Icons.phone,
                                  heading: "Phone No.",
                                  color: Color(0xFFAE58DB),
                                  title: phoneNumber,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, (0.0215 * height), 0, 0),
                        child: Card(
                          color: Color(0xFF2C2C2E),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                (0.05373 * width),
                                (0.0215 * height),
                                (0.02699 * height),
                                (0.05373 * width)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Saved Trips",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 28,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, (0.0205 * height), 0, 0),
                        child: Card(
                          color: Color(0xFF2C2C2E),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (0.05373 * width),
                                    (0.0215 * height),
                                    (0.02699 * height),
                                    (0.05373 * width)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.notifications,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              (0.0327 * width), 0, 0, 0),
                                          child: Text(
                                            "Notifications",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                      size: 28,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (0.05373 * width),
                                    (0.0215 * height),
                                    (0.02699 * height),
                                    (0.05373 * width)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.info,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              (0.0327 * width), 0, 0, 0),
                                          child: Text(
                                            "About Us",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                      size: 28,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (0.05373 * width),
                                    (0.0215 * height),
                                    (0.02699 * height),
                                    (0.05373 * width)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.question_mark_rounded,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                        Text(
                                          "Help and Support",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                      size: 28,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}

class Items extends StatelessWidget {
  const Items(
      {super.key,
      required this.icon,
      required this.heading,
      this.title = "Not Set",
      required this.color});

  final IconData icon;
  final String heading;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 36,
          height: 36,
          child: Icon(icon, color: color, size: 36),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
          child: Text(
            heading,
            style: TextStyle(color: color),
          ),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
