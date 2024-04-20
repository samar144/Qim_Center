import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qim_center/themes.dart';
import 'package:qim_center/utils/routes.dart';

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.light;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(onPressed: () {
      Get.offAllNamed(GetRoutes.loginscreen);
    }),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.grey,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

            final switcher = ThemeSwitcher.of(context)!;
            if (switcher != null) {
              switcher.changeTheme(theme: theme);
            } else {
              // Handle the case when ThemeSwitcher.of(context) returns null
              print('ThemeSwitcher is null');
            }
          },
        ),
      ),
    ],
  );
}
