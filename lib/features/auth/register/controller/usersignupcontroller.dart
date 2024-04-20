// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qim_center/navigate.dart';
import 'package:qim_center/utils/app_constants.dart';
import 'package:qim_center/utils/routes.dart';
import 'package:qim_center/widgets/loading_widget.dart';
import '../../../../utils/custom_snackbar.dart';

class UserSignUpController extends GetxController {
  late TextEditingController emailEditController,
      passwordEditController,
      cpasswordEditController,
      roleEditController,
      c1,
      c2,
      c3,
      c4,
      c5;

  @override
  void onInit() {
    super.onInit();
    emailEditController = TextEditingController();
    cpasswordEditController = TextEditingController();
    passwordEditController = TextEditingController();

    c1 = TextEditingController();
    c2 = TextEditingController();
    c3 = TextEditingController();
    c4 = TextEditingController();
    c5 = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailEditController.dispose();
    cpasswordEditController.dispose();
    passwordEditController.dispose();

    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
  }

  checksignup() {
    Get.showOverlay(
        asyncFunction: () => signup(), loadingWidget: const LoadingWidget());
  }

  signup() async {
    var role = "user";
    http.Response response =
        await http.post(Uri.parse(AppConstants.BASE_URL + '/api/auth/signup'),
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $token"
            },
            body: jsonEncode({
              "email": emailEditController.text,
              "role": role,
              "password": passwordEditController.text,
              "password_confirmation": cpasswordEditController.text
            }));

    print('Response status code: ${response.statusCode}');
    print('Response body: ${jsonDecode(response.body)}');
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    var res = jsonDecode(response.body);

    if (res["status"] == "success") {
      checksignup();
      await customsnackbar("success", res['message'], "success");
      Get.offAllNamed(GetRoutes.verify);
    } else {
      customsnackbar(" Error", res["message"], "error");
    }
  }

  sendVerificationCode(String otp) async {
    var response = await http.post(
      Uri.parse(AppConstants.BASE_URL + '/api/auth/ActiveEmail'),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${Get.arguments}"
      },
      body: {
        'email': emailEditController.text,
        'code': otp,
      },
    );
    print('Response status code: ${response.statusCode}');
    print('Response body: ${jsonDecode(response.body)}');
    print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

    var res = await jsonDecode(response.body);
    if (res["active"] == true) {
      customsnackbar("", res['message'], "sucess");
      Get.offAllNamed(GetRoutes.loginscreen);
    } else {
      customsnackbar(res['status'], res['message'], "error");
    }
  }
}
