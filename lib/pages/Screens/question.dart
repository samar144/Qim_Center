import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/consultations/family.dart';
import 'package:qim_center/pages/consultations/legal.dart';
import 'package:qim_center/pages/consultations/psychological.dart';
import 'package:qim_center/pallete.dart';

class question extends StatelessWidget {
  const question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'الاستشارات    ',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        shadowColor: Colors.grey,
      ),
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
                image: AssetImage('assets/images/img_4.png'),
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
                      height: 10,
                    ),
                    Container(
                      height: 57,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Pallete.borderColor,
                          width: 1.7,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Align(
                        child: Text(
                          'اختر الاستشارة التي ترغب بها',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 100,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                            10,
                          ))),
                          elevation: 5,
                          color: Color(0xFFDFBD69),
                          child: Text(
                            ' قانونية',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            navigateTo(context, legal());
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 100,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                            10,
                          ))),
                          elevation: 5,
                          color: Color(0xFFDFBD69),
                          child: Text(
                            ' نفسية',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            navigateTo(context, psychological());
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 100,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                            10,
                          ))),
                          elevation: 5,
                          color: Color(0xFFDFBD69),
                          child: Text(
                            ' أسرية',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            navigateTo(context, family());
                          },
                        ),
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
}
