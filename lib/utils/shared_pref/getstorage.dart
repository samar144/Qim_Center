import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:qim_center/features/auth/register/model/user_register_model.dart';
import 'package:qim_center/features/auth/signin/signin_model.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/navigate.dart';

class GetStorageUtils {
  static final _storage = GetStorage();

  void saveUser(UserModel userModel) {
    _storage.write('userModel', userModelToJson(userModel));
  }

  UserModel getUser() {
    String userModelJson = _storage.read('userModel');
    // if (userModelJson != null) {
    return userModelFromJson(userModelJson);
    // }
    // return null;
  }

  void removeUser() {
    _storage.remove('userModel');
  }

  String userModelToJson(UserModel data) {
    return '{ "email": "${data.email}","password":${data.password},"fcm_token":"${data.fcm_token}"}';
  }

  UserModel userModelFromJson(String str) {
    final Map<String, dynamic> json = jsonDecode(str);
    return UserModel(
      email: json['email'],
      password: json["emailVerifiedAt"],
      fcm_token: json['fcm_token'],
    );
  }

  // saveorphanid(String id) {
  //   _storage.write('orphan_id', id);
  // }

  // getorphanid() {
  //   String id = _storage.read('orphan_id');
  //   if (id != null) {
  //     return id;
  //   }
  //   return null;
  // }
}
