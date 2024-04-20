import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qim_center/features/profile/user_profile_controller.dart';
import 'package:qim_center/widgets/app_bar_widget.dart';
import 'package:qim_center/widgets/text_field_widget.dart';

class create_profile extends StatefulWidget {
  create_profile({Key? key}) : super(key: key);

  @override
  State<create_profile> createState() => _create_profileState();
}

class _create_profileState extends State<create_profile> {
  UserProfileController profilecontroller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img_3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Builder(
            builder: (context) => Scaffold(
              appBar: buildAppBar(context),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  MyTextFld(
                    label: 'الاسم الأول',
                    text: profilecontroller.nameEditController.text ?? '',
                    onChanged: (nameEditController) {},
                  ),
                  const SizedBox(height: 24),
                  MyTextFld(
                    label: 'اسم الأب',
                    text: profilecontroller.fatherNameEditController.text ?? '',
                    onChanged: (fatherNameEditController) {},
                  ),
                  const SizedBox(height: 24),
                  MyTextFld(
                    label: 'رقم الهاتف الجوال',
                    text:
                        profilecontroller.mobilePhoneEditController.text ?? '',
                    onChanged: (mobilePhoneEditController) {},
                  ),
                  const SizedBox(height: 24),
                  MyTextFld(
                    label: 'الاختصاص ',
                    text: profilecontroller.specializationEditController.text ??
                        '',
                    onChanged: (specializationEditController) {},
                  ),
                  const SizedBox(height: 24),
                  MyTextFld(
                    label: 'تاريخ الميلاد',
                    text: profilecontroller.birthDateEditController.text ?? '',
                    onChanged: (birthDateEditController) {},
                  ),
                  const SizedBox(height: 24),
                  MyTextFld(
                    label: 'الجنس ',
                    text: profilecontroller.genderEditController.text ?? '',
                    onChanged: (genderEditController) {},
                  ),
                  //const SizedBox(height: 24),
                  // MyTextFld(label: 'مستوى التحصيل العلمي', text: user.name, onChanged: (name) {  },),
                  const SizedBox(height: 24),
                  // MyTextFld(
                  //   label: 'الوضع العائلي ',
                  //   text: user.name,
                  //   onChanged: (name) {},
                  // ),
                  // const SizedBox(height: 24),
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
                        'التالي',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        profilecontroller.createProfile();
                        //  navigateAndFinish(context, bottomnavigation());
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
