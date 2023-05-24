import 'dart:math';

import 'package:flutter/material.dart';

class TweenANimat1 extends StatefulWidget {
  const TweenANimat1({Key? key}) : super(key: key);

  @override
  State<TweenANimat1> createState() => _TweenANimat1State();
}

class _TweenANimat1State extends State<TweenANimat1> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double>animation;
  //late Animation colorAnimation;
  //late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: Duration(seconds: 4),
    );
    animation=CurvedAnimation(
      curve:Curves.easeInOut,
      parent: controller, );
   /*colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);
*/
    setState(() {});
    controller.repeat(reverse:true);
  }
  @override
  void dispose() {
    // TODO: implement dispose
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
            child:ScaleTransition(
              scale: animation,
              child: SizedBox(
                  child: Icon(Icons.heart_broken,color: Colors.red,size: 250,shadows: [Shadow(blurRadius: 15,color: Colors.red)])),
            )

           /* Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              child: Image.asset('assets/wel.png')
            ),*/
          ),
        ],
      ),
    );
  }
}
