// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/consultations/consultation_appointment%20.dart';

class cons_details extends StatefulWidget {
  const cons_details({Key? key}) : super(key: key);

  @override
  State<cons_details> createState() => _cons_detailsState();
}

class _cons_detailsState extends State<cons_details> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pinned: true,
            centerTitle: false,
            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: Image(
                //..........
                image:
                    // NetworkImage(''),
                    AssetImage('assets/images/img_4.png'),
                width: 20,
                height: 20,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(23.0),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      //....................
                      child: Text(
                        '.... الدكتور',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'حول المستشار',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      //................
                      child: Text(
                        'السماح لمستخدم واحد الاتصال بقاعدة المعطيات بشرط أن تكون مدة الاتصال الفعال ساعة ومدة الاتصال الغير فعال هخحخحخحخحجحمجححححححححح',
                        maxLines: isReadMore ? null : 2,
                        overflow: isReadMore
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: buildButton(),
                    ),
                    SizedBox(
                      height: 135,
                    ),
                    Container(
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
                          'حجز استشارة',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          navigateTo(context, cons_appointment());
                        },
                      ),
                    ),
                  ],
                )),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildButton() => TextButton(
        child: Text(isReadMore ? 'عرض أقل' : 'عرض المزيد'),
        onPressed: () => setState(() {
          isReadMore = !isReadMore;
        }),
      );
}
