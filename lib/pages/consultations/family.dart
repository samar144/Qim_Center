import 'package:flutter/material.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/Screens/question.dart';
import 'package:qim_center/pages/consultations/consultant_details%20.dart';

class family extends StatelessWidget {
  const family({Key? key}) : super(key: key);

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
                  'أسرية       ',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              // IconButton(
              //   icon: Icon(Icons.keyboard_arrow_right_outlined),
              //   color: Colors.black87,
              //   iconSize: 30,
              //   onPressed: () {
              //     navigateAndFinish(context, question());
              //   },
              // ),
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
      body: Container(
        padding: EdgeInsets.all(12),
        color: Colors.grey[50],
        child: ListView.separated(
          //...........
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                title: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    //.........
                    ' ...الدكتور',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    //........
                    'دكتوراه في علم الاجتماع',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                onTap: () {},
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0XFFAEEDC82),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.only(bottom: 1),
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      navigateTo(context, cons_details());
                    },
                  ),
                ),
                trailing: Image(
                  //................
                  image: // NetworkImage(''),
                      AssetImage(
                    'assets/images/img_4.png',
                  ),
                  fit: BoxFit.cover,
                ),
                contentPadding: EdgeInsets.all(15),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.grey[50],
          ),
        ),
      ),
    );
  }
}
