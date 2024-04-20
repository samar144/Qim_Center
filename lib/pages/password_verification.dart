// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qim_center/features/auth/register/controller/usersignupcontroller.dart';

import 'package:qim_center/pallete.dart';

class password extends StatefulWidget {
  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  final List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());
  String code = '';
  final UserSignUpController verifycontroller = Get.put(UserSignUpController());
  // TextEditingController c1 = TextEditingController();
  // TextEditingController c2 = TextEditingController();
  // TextEditingController c3 = TextEditingController();
  // TextEditingController c4 = TextEditingController();
  // TextEditingController c5 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
              delegate: SliverChildListDelegate(
                [
                  GetBuilder<UserSignUpController>(
                    builder: (verifycontroller) {
                      return Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    'الرجاء إدخال الكود الذي تم إرساله ' +
                                        '    ' +
                                        '\n' +
                                        '          ' +
                                        'إلى البريد الإلكتروني',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Form(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(5, (index) {
                                    return SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width / 7,
                                      child: TextFormField(
                                        controller: controllers[index],
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            FocusScope.of(context).nextFocus();
                                          } else if (value.isEmpty) {
                                            FocusScope.of(context)
                                                .previousFocus();
                                          }
                                        },
                                        onSaved: (pin1) {},
                                        decoration: InputDecoration(
                                          hintText: '0',
                                          hintStyle: TextStyle(
                                            color: Pallete.borderColor,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Pallete.borderColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        textAlign: TextAlign.center,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      ),
                                    );
                                  }),
                                  // SizedBox(
                                  //   height: 50,
                                  //   width: 50,
                                  //   child: TextFieldOTP(
                                  //       controller: verifycontroller.c1,
                                  //       first: true,
                                  //       last: false),
                                  // ),
                                  // SizedBox(
                                  //   height: 50,
                                  //   width: 50,
                                  //   child: TextFieldOTP(
                                  //       controller: verifycontroller.c2,
                                  //       first: false,
                                  //       last: false),
                                  // ),
                                  // SizedBox(
                                  //   height: 50,
                                  //   width: 50,
                                  //   child: TextFieldOTP(
                                  //       controller: verifycontroller.c3,
                                  //       first: false,
                                  //       last: false),
                                  // ),
                                  // SizedBox(
                                  //   height: 50,
                                  //   width: 50,
                                  //   child: TextFieldOTP(
                                  //       controller: verifycontroller.c4,
                                  //       first: false,
                                  //       last: false),
                                  // ),
                                  // SizedBox(
                                  //   height: 50,
                                  //   width: 50,
                                  //   child: TextFieldOTP(
                                  //       controller: verifycontroller.c5,
                                  //       first: false,
                                  //       last: true),
                                  // ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                width: double.infinity,
                                height: 60,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(
                                    10,
                                  ))),
                                  elevation: 5,
                                  color: Color(0xFFDFBD69),
                                  child: Text(
                                    ' تأكيد',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    String otp = controllers
                                        .map((controller) => controller.text)
                                        .join();
                                    verifycontroller.sendVerificationCode(otp);
                                    //print('c1: ${verifycontroller.c1.text}');
                                    print('otp entered:: $otp');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldOTP extends StatelessWidget {
  bool first;
  bool last;
  TextEditingController controller;
  TextFieldOTP({
    super.key,
    required this.first,
    required this.last,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && last == false) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty && first == false) {
          FocusScope.of(context).previousFocus();
        }
      },
      onSaved: (pin1) {},
      decoration: InputDecoration(
        hintText: '0',
        hintStyle: TextStyle(
          color: Pallete.borderColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Pallete.borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: Theme.of(context).textTheme.headline6,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
