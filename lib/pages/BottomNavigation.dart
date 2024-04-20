import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qim_center/pages/Screens/home_page.dart';
import 'package:qim_center/pages/Screens/profile.dart';
import 'package:qim_center/pages/Screens/question.dart';
import 'package:qim_center/pages/Screens/video.dart';
import 'package:qim_center/pallete.dart';

class bottomnavigation extends StatefulWidget {
  @override
  State<bottomnavigation> createState() => _bottomnavigationState();
}

class _bottomnavigationState extends State<bottomnavigation> {
  int _currentindex = 0;

  List<Widget> screens = [
    HomePage(),
    video(),
    question(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[_currentindex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentindex,
            onTap: (int newIndex) {
              setState(() {
                _currentindex = newIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: _currentindex == 0 ? Pallete.borderColor : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.video_collection_outlined,
                  size: 30,
                  color: _currentindex == 1 ? Pallete.borderColor : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.question_answer_outlined,
                  size: 30,
                  color: _currentindex == 2 ? Pallete.borderColor : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.person_outline,
                  size: 30,
                  color: _currentindex == 3 ? Pallete.borderColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
