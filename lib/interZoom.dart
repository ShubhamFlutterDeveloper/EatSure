import 'package:flutter/material.dart';

class ZoomerInteractive extends StatefulWidget {
  const ZoomerInteractive({Key? key}) : super(key: key);

  @override
  State<ZoomerInteractive> createState() => _ZoomerInteractiveState();
}

class _ZoomerInteractiveState extends State<ZoomerInteractive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(

        //scaleEnabled: true,
        maxScale: 10,
        boundaryMargin: EdgeInsets.all(double.infinity),
        child:Scaffold(
          body: Container(
            color: Colors.red,
            height: 100,
            width: 100,
            child: Image.asset('assets/fastfood.jpg'),
          ),
        ),

      ),
    );
  }
}
