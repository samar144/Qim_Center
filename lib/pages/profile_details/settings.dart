import 'package:flutter/material.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/Screens/profile.dart';

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    'الإعدادات  ',
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
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right_outlined),
                  color: Colors.black87,
                  iconSize: 30,
                  onPressed: () {
                    navigateAndFinish(context, profile());
                  },
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
      ),
    );
  }
}
