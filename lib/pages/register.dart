import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qim_center/features/auth/register/controller/usersignupcontroller.dart';
import 'package:qim_center/pages/textfield.dart';
import 'package:qim_center/utils/routes.dart';

class Register extends StatelessWidget {
  final UserSignUpController registercontroller =
      Get.put(UserSignUpController());

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
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                pinned: true,
                leading: BackButton(onPressed: () {
                  Get.offAllNamed(GetRoutes.loginscreen);
                }),
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
                      builder: (registercontroller) {
                        return Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 0,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      'إنشاء حساب ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Field(
                                  controller:
                                      registercontroller.emailEditController,
                                  input_type: TextInputType.emailAddress,
                                  hintText: 'البريد الإلكتروني ',
                                  icon: Icons.email_outlined,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Field(
                                  controller:
                                      registercontroller.passwordEditController,
                                  input_type: TextInputType.visiblePassword,
                                  hintText: 'كلمة المرور',
                                  icon: Icons.visibility_off,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Field(
                                  controller: registercontroller
                                      .cpasswordEditController,
                                  input_type: TextInputType.visiblePassword,
                                  hintText: 'تأكيد كلمة المرور',
                                  icon: Icons.visibility_off,
                                ),
                                SizedBox(
                                  height: 25,
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
                                      ' إنشاء حساب',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      registercontroller.signup();
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
      ),
    );
  }
}
