import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';

class RipplesAnimation extends StatefulWidget {
  const RipplesAnimation({Key? key}) : super(key: key);

  @override
  _RipplesAnimationState createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Ripple Demo"),
      ),
      body: Center(
        child: Stack(
          children: [
            ///Show Ripple Widget
            FlutterRipple(
              rippleShape: BoxShape.circle,
              radius: 120,
              child:Icon(Icons.account_circle,size: 40,shadows: [BoxShadow(blurRadius: 5.0) ]),
              rippleColor: Colors.blue,
              onTap: () {
                print("hello");
              },
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 + 150,
              right: 50,
              left: 50,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Searching for location.",
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Find All Location",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
