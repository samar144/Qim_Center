import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qim_center/features/auth/register/controller/usersignupcontroller.dart';
import 'package:qim_center/features/auth/register/model/user_register_model.dart';
import 'package:qim_center/features/auth/signin/signin_model.dart';
import 'package:qim_center/utils/app_constants.dart';
import 'package:qim_center/utils/custom_snackbar.dart';
import 'package:qim_center/utils/routes.dart';
import 'package:http/http.dart' as http;
import 'package:qim_center/utils/shared_pref/getstorage.dart';
import 'package:qim_center/utils/shared_pref/shared_prefs.dart';
import 'package:qim_center/widgets/loading_widget.dart';

class LoginController extends GetxController {
  late TextEditingController emailEditController,
      passwordEditController,
      fcmTokenEditController;
  @override
  void onInit() {
    emailEditController = TextEditingController();
    fcmTokenEditController = TextEditingController();
    passwordEditController = TextEditingController();

    // ever(_connectivityService.hasConnection, handleConnectivityChanged);

    // checkuser();
    super.onInit();
  }

  checkuser() async {
    var token = ShredPref.gettoken();
    if (token != null) {
      // Get.offAllNamed(
      //   GetRoutes.sponserhomepage,
      //   predicate: (route) => true,
      // );
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailEditController.dispose();
    passwordEditController.dispose();
    fcmTokenEditController.dispose();
  }

  checklogin() {
    Get.showOverlay(
        asyncFunction: () => login(), loadingWidget: const LoadingWidget());
  }

  // void handleConnectivityChanged(bool hasConnection) {
  //   if (hasConnection) {

  //   } else {
  //     customsnackbar("", "غير متصل بالانترنيت", "error");
  //   }
  // }

  login() async {
    var fcmToken = "HGHjjjjjjjjjjjjjjjjjjjjjjjGH";
    var response = await http
        .post(Uri.parse(AppConstants.BASE_URL + '/api/auth/login'), body: {
      'email': emailEditController.text,
      'password': passwordEditController.text,
      'fcm_token': fcmToken
    }, headers: {
      "Accept": "application/json"
    });
    print('Response status code: ${response.statusCode}');
    print('Response body: ${jsonDecode(response.body)}');
    print("llllllllllllllllllllllllllllllllll");
    var res = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      UserModel user = UserModel(
        email: emailEditController.text,
        password: passwordEditController.text,
        fcm_token: fcmTokenEditController.text,
      );
      GetStorageUtils().saveUser(user);
      customsnackbar("login sucsses", "yes", "sucess");

      Get.offAllNamed(GetRoutes.homePage);
    } else {
      customsnackbar("login Error", res['message'], "error");
    }
  }

  // forgetpassword() async {
  //   UserModel loginModel = UserModel(email: emailEditController.text);
  //   var response = await http.post(
  //       Uri.parse('${AppConstants.BASE_URL}/api/forget/password'),
  //       body: jsonEncode(loginModel),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json"
  //       });
  //   var res = await jsonDecode(response.body);
  //   if (res["success"] == false) {
  //     Get.offNamed(GetRoutes.resetpassword);
  //   } else {
  //     customsnackbar("signup Error", res['message'], "error");
  //   }
  // }

  // resetpassword() async {
  //   var response = await http.post(
  //       Uri.parse(AppConstants.BASE_URL + '/api/reset/password'),
  //       body: jsonEncode({
  //         "email": emailEditController.text,
  //         "password": passwordEditController.text,
  //         "password_confirmation": cpasswordEditController.text,
  //         "token": tokenEditController.text,
  //       }),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json"
  //       });
  //   var res = await jsonDecode(response.body);
  //   if (res["success"] == true) {
  //     customsnackbar("", res['message'], "sucess");
  //     Get.offNamed(GetRoutes.login);
  //     print("ssssaaammmaaarrrr");
  //   } else {
  //     customsnackbar(res['message'], res['data']['error'], "error");
  //   }
  // }
}
