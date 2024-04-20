import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/login.dart';
import 'package:qim_center/pallete.dart';

class Logo extends StatefulWidget {
  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => navigateAndFinish(context, LoginScreen()),
    );
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    controller.repeat();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromRGBO(223, 189, 105, 1),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [
                0.1,
                0.5,
                1
              ],
              colors: [
                Color.fromRGBO(223, 189, 105, 1),
                Color.fromARGB(255, 251, 247, 236),
                Color.fromRGBO(223, 189, 105, 1),
              ]),
          // color: Colors.amber

          // image: DecorationImage(
          //   image: AssetImage("images/backgroundOne.jpg"),
          // ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/traced-img_1.png',
                  height: 140,
                  width: 140,
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: animation,
                      child: Image.asset(
                        'assets/images/img_2.png',
                      ),
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
