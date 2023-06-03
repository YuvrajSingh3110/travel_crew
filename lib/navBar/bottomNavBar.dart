import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_crew/views/chat.dart';
import 'package:travel_crew/views/explore.dart';
import 'package:travel_crew/views/home.dart';
import 'package:travel_crew/views/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currIndex = 0; // Index of the current selected tab

  // List of screens to display in the bottom navigation bar
  final List<Widget> screens = [
    Home(),
    Chat(),
    Explore(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    log("here");
    return Scaffold(
      body: screens[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff312E38),
        currentIndex: currIndex,
        onTap: (int index) {
          setState(() {
            currIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Color(0xff312E38),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            backgroundColor: Color(0xff312E38),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            backgroundColor: Color(0xff312E38),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Color(0xff312E38),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
