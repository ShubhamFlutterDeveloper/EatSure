import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';
import 'dart:math' as math;
class RotateTransAni extends StatefulWidget {
  const RotateTransAni({Key? key}) : super(key: key);

  @override
  State<RotateTransAni> createState() => _RotateTransAniState();
}

class _RotateTransAniState extends State<RotateTransAni> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double>animation;
  void initState() {
    super.initState();
    controller =  AnimationController(vsync:this , duration: Duration(seconds:1),
    );
    animation=CurvedAnimation(
      curve:Curves.easeIn,
      parent: controller,
    );
    /*colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);
*/
    controller.repeat();
  }
  void dispose(){
    super.dispose();

    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
      /*child: Container (
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const SweepGradient(
          startAngle: math.pi * 0.2,
          endAngle: math.pi * 1.9,
          colors: [
            Colors.red,
            Colors.yellow,
            Colors.blue,
            Colors.green,
            Colors.red,
          ],
          stops: <double>[0.0, 0.25, 0.5, 0.75, 1.4],
          tileMode: TileMode.mirror,
        ),
      ),
    )*/

        child:Container(
               child:  FlutterRipple(
        rippleShape: BoxShape.circle,
        //duration: Duration(milliseconds: 500),
        radius: 100,
        child:Icon(Icons.account_circle,size: 40,shadows: [BoxShadow(blurRadius: 5.0) ]),
        rippleColor: Colors.purple,
        onTap: () {
          print("hello");
        },
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const RadialGradient(
          transform: GradientRotation(10),
          colors: [Colors.red,Colors.lightBlue, Colors.yellow],
          radius: 0.5,
          focal: Alignment(0.20, 0.70),
        ),
      ),
    ),



    /*Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.9,
      // Below is the code for Linear Gradient.
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          //tileMode: TileMode.mirror,
          stops: [0.3,0.9]
        ),
      ),
    )*/


    /*RotationTransition(
                turns: animation,
                alignment: Alignment.center,
                child: SizedBox(
                    child: Icon(Icons.heart_broken,color: Colors.red,size: 250,shadows: [Shadow(blurRadius: 15,color: Colors.red)])),
              )*/

            /* Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              child: Image.asset('assets/wel.png')
            ),*/
          
          )
        ],
      ),
    );
  }
}
