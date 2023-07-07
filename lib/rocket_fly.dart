import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RocketFly extends StatefulWidget {
  const RocketFly({Key? key}) : super(key: key);

  @override
  State<RocketFly> createState() => _RocketFlyState();
}

class _RocketFlyState extends State<RocketFly> with SingleTickerProviderStateMixin {

  double bottomMargin = 0;
  void _flyRocket() {
    setState(() {
      bottomMargin = 300;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('assets/stars.jpg',fit: BoxFit.fill,)),
          AnimatedContainer(
            duration: Duration(seconds: 2),
            height: 450,
            width: 250,
            margin: EdgeInsets.only(bottom: bottomMargin),
            child: Image.asset('assets/images (1).png'),
          ),
          Positioned(
            bottom: 10,
            left: 30.w,
            child: ElevatedButton(
              onPressed: () {
                _flyRocket();
              },
              child: Text(
                'Launch',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          )
        ],
      ),

    );
  }
}
