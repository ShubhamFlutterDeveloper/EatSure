import 'package:flutter/material.dart';

class NewRippleEf extends StatefulWidget {
  const NewRippleEf({Key? key}) : super(key: key);

  @override
  State<NewRippleEf> createState() => _NewRippleEfState();
}

class _NewRippleEfState extends State<NewRippleEf> with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  final listRadius=[150.0,200.0,250.0,300.0,350.0,400.0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 1),lowerBound: 0.4);
    _animation=Tween(begin: 0.0,end: 1.5).animate(_animationController);
    _animationController.addListener(() { });
    setState(() {});

    _animationController.forward();
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose(); //destory anmiation to free memory on last
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Stack(
          alignment: Alignment.center,
          children:[
            BuildContainer(listRadius[0]),
            BuildContainer(listRadius[1]),
            BuildContainer(listRadius[2]),
            BuildContainer(listRadius[3]),
            BuildContainer(listRadius[4]),
          ]
        ),
      )
    );
  }
Widget BuildContainer(radius){
    return Container(
      width: radius*_animation.value,
      height: radius*_animation.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightGreen.withOpacity(1.0 -_animation.value)
      ),
    );
}
}
