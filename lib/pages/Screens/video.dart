// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qim_center/pallete.dart';
import 'package:percent_indicator/percent_indicator.dart';

class video extends StatelessWidget {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              onPressed: () {
                // Get.toNamed(GetRoutes.);
              }),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'فيديوهاتي',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromRadius(33),
            child: Column(
              children: [
                TabBar(
                  // controller: _tabController,
                  tabs: const [
                    Tab(text: 'المكتملة'),
                    Tab(text: 'قيد التعلم'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          // controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 450,
                  height: 150,
                  margin:
                      EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Color.fromRGBO(239, 240, 238, 1), width: 1)
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Color(0XFFe8e8e8),
                      //       blurRadius: 5.0,
                      //       offset: Offset(0, 5)),
                      //   BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      // BoxShadow(color: Colors.white, offset: Offset(0, -5)),
                      // ]
                      ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 150,
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/g1.jpg"))),
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              // color: Colors.lime,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "دورةالتفسير",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 20),
                                          ),
                                          SizedBox(height: 40.0),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '  10 دروس',
                                                    style: TextStyle(
                                                        color: Colors.black45),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                    '  100%  ',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child:
                                                    new LinearPercentIndicator(
                                                  width: 180,
                                                  lineHeight: 10.0,
                                                  percent: 1.0,
                                                  backgroundColor: Colors.grey,
                                                  progressColor:
                                                      Pallete.borderColor,
                                                  center: Text(
                                                    "100.0%",
                                                    style: new TextStyle(
                                                        fontSize: 8.0),
                                                  ),
                                                  barRadius:
                                                      Radius.circular(50),
                                                ),
                                              ),
                                            ],
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
                      ]),
                );
              },
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 450,
                  height: 150,
                  margin:
                      EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Color.fromARGB(255, 239, 239, 238), width: 1.0),
                    //boxShadow: [
                    // BoxShadow(
                    //     color: Color(0XFFe8e8e8),
                    //     blurRadius: 5.0,
                    //     offset: Offset(0, 5)),
                    // BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    // BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                    // ]
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 150,
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/g3.jpg"))),
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              // color: Colors.lightBlue,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "دورة الأم إذا أعددتها",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 20),
                                          ),
                                          SizedBox(height: 40.0),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '   14 دروس  ',
                                                    style: TextStyle(
                                                        color: Colors.black45),
                                                  ),
                                                  SizedBox(
                                                    width: 39,
                                                  ),
                                                  Text(
                                                    '  5 دروس ',
                                                    style: TextStyle(
                                                        color: Colors.black45),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(0),
                                                child:
                                                    new LinearPercentIndicator(
                                                  width: 180.0,
                                                  lineHeight: 10.0,
                                                  percent: 0.5,
                                                  backgroundColor: Colors.grey,
                                                  progressColor:
                                                      Pallete.borderColor,
                                                  center: Text(
                                                    "50.0%",
                                                    style: new TextStyle(
                                                        fontSize: 8.0),
                                                  ),
                                                  barRadius:
                                                      Radius.circular(50),
                                                ),
                                              ),
                                            ],
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
                      ]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
