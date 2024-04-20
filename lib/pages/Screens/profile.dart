// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/login.dart';
import 'package:qim_center/pages/profile_details/certificate.dart';
import 'package:qim_center/pages/profile_details/consultation.dart';
import 'package:qim_center/pages/profile_details/courses.dart';
import 'package:qim_center/pages/profile_details/settings.dart';
import 'package:qim_center/pallete.dart';
import 'package:url_launcher/url_launcher.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri phoneNumber = Uri.parse('tel:+963 952 172 066');
    final Uri whatsApp = Uri.parse('http://wa.me/+963952172066');

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person_outline_rounded,
                            color: Pallete.borderColor, size: 80),
                        radius: 53,
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFE3C871)),
                        child: Text(
                          'اسم المستخدم',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 212,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            width: 370,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                  style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  )),
                                  onPressed: () {
                                    navigateTo(context, settings());
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    color: Colors.black54,
                                    size: 25,
                                  ),
                                  label: Text(
                                    '                                الإعدادات    ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xFFf4acb7),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.settings),
                                    color: Colors.white,
                                    onPressed: () {
                                      navigateTo(context, settings());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                            thickness: 1,
                            endIndent: 45,
                          ),
                          Container(
                            width: 370,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                  style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  )),
                                  onPressed: () {
                                    navigateTo(context, course());
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    color: Colors.black54,
                                    size: 26,
                                  ),
                                  label: Text(
                                    '                     الدورات المحفوظة  ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xFFa2d600),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.save_outlined),
                                    color: Colors.white,
                                    onPressed: () {
                                      navigateTo(context, course());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                            thickness: 1,
                            endIndent: 45,
                          ),
                          Container(
                            width: 370,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                  style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  )),
                                  onPressed: () {
                                    navigateTo(context, consultation());
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    color: Colors.black54,
                                    size: 26,
                                  ),
                                  label: Text(
                                    '                               استشاراتي   ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xFFFFE600),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.question_answer_outlined),
                                    color: Colors.white,
                                    onPressed: () {
                                      navigateTo(context, consultation());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 147,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            width: 370,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                  style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  )),
                                  onPressed: () {
                                    navigateTo(context, certificate());
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    color: Colors.black54,
                                    size: 26,
                                  ),
                                  label: Text(
                                    '                                  شهاداتي  ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xFFBE93D4),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.badge_outlined),
                                    color: Colors.white,
                                    onPressed: () {
                                      navigateTo(context, certificate());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                            thickness: 1,
                            endIndent: 45,
                          ),
                          Container(
                            width: 370,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                  style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  )),
                                  onPressed: () async {
                                    print(await canLaunchUrl(phoneNumber));
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    color: Colors.black54,
                                    size: 26,
                                  ),
                                  label: Text(
                                    '                              تواصل معنا  ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xFF6D4ABF),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.contact_phone_outlined),
                                    color: Colors.white,
                                    onPressed: () async {
                                      launchUrl(whatsApp);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 80,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            width: 370,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  )),
                                  onPressed: () {},
                                  child: Text(
                                    '                                 تسجيل الخروج  ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.black26,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.logout_outlined),
                                    color: Colors.white,
                                    onPressed: () {
                                      navigateAndFinish(context, LoginScreen());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
