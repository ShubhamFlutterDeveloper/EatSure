import 'package:eatsure/rocket_fly.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class SwipeButton extends StatefulWidget {
  const SwipeButton({Key? key}) : super(key: key);

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  bool isFinished=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment Screen'),
        backgroundColor: Color(0xFF009C41),
        elevation: 0,
      ),
      body:  Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.0),
          child: SwipeableButtonView(

            buttonText: 'SLIDE TO PAYMENT',
            buttonWidget: Container(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              ),
            ),
            activeColor: Color(0xFF009C41),
            isFinished: isFinished,
            onWaitingProcess: () {
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  isFinished = true;
                });
              });
            },
            onFinish: () async {
              Navigator.push(context,MaterialPageRoute(builder: (context) => RocketFly(),));
              setState(() {
                isFinished = false;
              });
            },
          ),
        ),
      ),
    );
  }
}
