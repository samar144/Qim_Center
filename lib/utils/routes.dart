import 'package:get/get.dart';
import 'package:qim_center/pages/login.dart';
import 'package:qim_center/pages/password_verification.dart';
import 'package:qim_center/pages/register.dart';
import 'package:qim_center/pages/Screens/home_page.dart';

class GetRoutes {
  static const String loginscreen = "/LoginScreen";
  static const String register = "/Register";
  static const String verify = "/password";
  static const String homePage = "/HomePage";

  static List<GetPage> route = [
    GetPage(
      name: GetRoutes.loginscreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: GetRoutes.register,
      page: () => Register(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.verify,
      page: () => password(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: GetRoutes.homePage,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
  ];
}
