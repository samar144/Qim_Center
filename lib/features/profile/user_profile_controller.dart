import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qim_center/navigate.dart';
import 'package:qim_center/utils/app_constants.dart';
import 'package:qim_center/utils/routes.dart';
import 'package:qim_center/widgets/loading_widget.dart';
import '../../../../utils/custom_snackbar.dart';

class UserProfileController extends GetxController {
  late TextEditingController nameEditController,
      lastNameEditController,
      fatherNameEditController,
      genderEditController,
      birthDateEditController,
      mobilePhoneEditController,
      specializationEditController;

  @override
  void onInit() {
    super.onInit();
    nameEditController = TextEditingController();
    lastNameEditController = TextEditingController();
    fatherNameEditController = TextEditingController();

    genderEditController = TextEditingController();
    birthDateEditController = TextEditingController();
    mobilePhoneEditController = TextEditingController();
    specializationEditController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameEditController.dispose();
    lastNameEditController.dispose();
    fatherNameEditController.dispose();
    genderEditController.dispose();
    birthDateEditController.dispose();
    mobilePhoneEditController.dispose();
    specializationEditController.dispose();
  }

  checkCreate() {
    Get.showOverlay(
        asyncFunction: () => createProfile(),
        loadingWidget: const LoadingWidget());
  }

  createProfile() async {
    http.Response response = await http.post(
        Uri.parse(AppConstants.BASE_URL + '/api/user/profile/create'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({
          "name": nameEditController.text,
          "fatherName": fatherNameEditController.text,
          "lastName": lastNameEditController.text,
          "gender": genderEditController.text,
          "birthDate": birthDateEditController.text,
          "mobilePhone": mobilePhoneEditController.text,
          "specialization": specializationEditController.text
        }));

    print('Response status code: ${response.statusCode}');
    print('Response body: ${jsonDecode(response.body)}');
    print("profile created**********");
    var res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      await customsnackbar("success", res['message'], "success");
      Get.offAllNamed(GetRoutes.loginscreen);
    } else {
      customsnackbar(" Error", res["message"], "error");
    }
  }

  // sendVerificationCode(String otp) async {
  //   var response = await http.post(
  //     Uri.parse(AppConstants.BASE_URL + '/api/auth/ActiveEmail'),
  //     headers: {
  //       "Accept": "application/json",
  //       "Authorization": "Bearer ${Get.arguments}"
  //     },
  //     body: {
  //       'email': emailEditController.text,
  //       'code': otp,
  //     },
  //   );
  //   print('Response status code: ${response.statusCode}');
  //   print('Response body: ${jsonDecode(response.body)}');
  //   print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

  //   var res = await jsonDecode(response.body);
  //   if (res["active"] == true) {
  //     customsnackbar("", res['message'], "sucess");
  //     Get.offAllNamed(GetRoutes.loginscreen);
  //   } else {
  //     customsnackbar(res['status'], res['message'], "error");
  //   }
  // }
}
