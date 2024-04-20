import 'package:flutter/material.dart';
import 'package:qim_center/pallete.dart';

class notification extends StatelessWidget {
  const notification({Key? key}) : super(key: key);

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
                  'الإشعارات        ',
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
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[50],
        child: ListView.separated(
          //...........
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(width: 1, color: Pallete.borderColor),
              ),

              child: Padding(
                padding: const EdgeInsets.only(right: 2, left: 2),
                child: ListTile(
                  title: Text(
                    //.........
                    'يبدأ التسجيل على دورة التفسير من 11 إلى نهاية الشهر الحالي',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    //........
                    'الأربعاء الساعة 10:40 م',
                    style: TextStyle(fontSize: 11),
                  ),
                  onTap: () {},
                ),
              ),
              //),
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
