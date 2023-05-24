import 'dart:async';

import 'package:eatsure/ev_project_task/ev_login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EvSplashScreen extends StatefulWidget {
  const EvSplashScreen({Key? key}) : super(key: key);

  @override
  State<EvSplashScreen> createState() => _EvSplashScreenState();
}

class _EvSplashScreenState extends State<EvSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:2),() =>
       Get.off(EVLoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: Stack(
          children: [
           Container(
            color: Color(0xff09B0D9),),
          Positioned(
            left: 110,
              top: 180,
              child: SvgPicture.asset('assets/Vector.svg')),
          Positioned(
            left: 144,
              top: 205,
              child: SvgPicture.asset('assets/Vector Splash.svg')),
            Positioned(
                top: 380,
                left: 143,
                child: Text('EASY-V',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w700),))
      ],
        ),
      )
    );
  }
}
