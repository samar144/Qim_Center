import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qim_center/features/question2.dart';
import 'package:qim_center/navigate.dart';

class question_3 extends StatelessWidget {
  const question_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  'استبيان          ',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        shadowColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            Center(
              child: Container(
                height: 470,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
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
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Text('السؤال الثالث', style: TextStyle(fontSize: 17))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFECD37A))),
                    onPressed: () {
                      navigateTo(context, question_2());
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    label: Text(
                      'السابق',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: double.infinity,
                height: 60,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                    10,
                  ))),
                  elevation: 5,
                  color: Color(0xFFDFBD69),
                  child: Text(
                    'إرسال الاستبيان',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
