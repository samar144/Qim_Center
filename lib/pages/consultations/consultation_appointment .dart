import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/Screens/question.dart';

class cons_appointment extends StatefulWidget {
  const cons_appointment({Key? key}) : super(key: key);

  @override
  State<cons_appointment> createState() => _cons_appointmentState();
}

class _cons_appointmentState extends State<cons_appointment> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'حجز موعد استشارة    ',
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
            automaticallyImplyLeading: false,
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
              Container(
                padding: EdgeInsets.all(23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'اختر التاريخ والوقت',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            label: Text(
                              '${dateTime.year}/${dateTime.month}/ ${dateTime.day} ',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              final date = await pickDate();
                              if (date == null) return; // pressed 'CANCEL'
                              final newDateTime = DateTime(
                                date.year,
                                date.month,
                                date.day,
                                dateTime.hour,
                                dateTime.minute,
                              );
                              setState(
                                  () => dateTime = newDateTime); // pressed 'OK'
                            },
                            icon: Icon(
                              Icons.date_range_outlined,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFE3C871),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            label: Text(
                              '$hours:$minutes',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              final time = await pickTime();
                              if (time == null) return; // pressed 'CANCEL'
                              final newDateTime = DateTime(
                                dateTime.year,
                                dateTime.month,
                                dateTime.day,
                                time.hour,
                                time.minute,
                              );
                              setState(
                                  () => dateTime = newDateTime); // pressed 'OK'
                            },
                            icon: Icon(
                              Icons.timer_outlined,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFE3C871),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 108,
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
                          'إرسال',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          navigateAndFinish(context, question());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: dateTime.hour,
          minute: dateTime.minute,
        ),
      );
}
