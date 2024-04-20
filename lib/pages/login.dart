import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:qim_center/features/auth/register/controller/usersignupcontroller.dart';
import 'package:qim_center/features/auth/signin/signin_controller.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/BottomNavigation.dart';
import 'package:qim_center/pages/createprofile.dart';
import 'package:qim_center/pages/password_verification.dart';
import 'package:qim_center/pages/register.dart';
import 'package:qim_center/pages/textfield.dart';

class LoginScreen extends StatelessWidget {
  final LoginController logincontroller = Get.put(LoginController());
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
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
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
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Field(
                            controller: logincontroller.emailEditController,
                            input_type: TextInputType.emailAddress,
                            hintText: 'البريد الإلكتروني ',
                            icon: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Field(
                            controller: logincontroller.passwordEditController,
                            input_type: TextInputType.visiblePassword,
                            hintText: 'كلمة المرور',
                            icon: Icons.visibility_off,
                          ),
                          SizedBox(
                            height: 30,
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
                                'تسجيل الدخول',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                logincontroller.login();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    navigateAndFinish(context, Register());
                                  },
                                  child: Text(
                                    'إنشاء حساب',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  'ليس لديك حساب مسبقاً؟',
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, password());
                                },
                                child: Text(
                                  'هل نسيت كلمة المرور؟',
                                  style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
