import 'package:flutter/material.dart';
import 'dart:math' as math;
class ListViewBuilderr extends StatefulWidget {
  const ListViewBuilderr({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderr> createState() => _ListViewBuilderrState();
}

class _ListViewBuilderrState extends State<ListViewBuilderr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Builder'),
      ),
      body: ListView(
        shrinkWrap: true,
       scrollDirection: Axis.vertical,
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              height: 50,
             width: double.infinity,
             color: Color((math.Random().nextDouble() * 0xFFfb3f46).toInt()).withOpacity(0.4),
            ),),
          SizedBox(
            height: 50,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: double.infinity,
              color: Color((math.Random().nextDouble() * 0xFFdd5ce9).toInt()).withOpacity(0.4),
            ),),
          SizedBox(
            height: 50,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: double.infinity,
              color: Color((math.Random().nextDouble() * 0xFFfb3f46).toInt()).withOpacity(0.4),
            ),),
          SizedBox(
            height: 50,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: double.infinity,
              color: Color((math.Random().nextDouble() * 0xFF3f5efb).toInt()).withOpacity(0.4),
            ),),
          SizedBox(
            height: 50,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: double.infinity,
              color: Color((math.Random().nextDouble() * 0xFFfb3f46).toInt()).withOpacity(0.4),
            ),),
          SizedBox(
            height: 50,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: double.infinity,
              color: Color((math.Random().nextDouble() * 0xFF3f5efb).toInt()).withOpacity(0.4),
            ),),






        ],
      ),
    );
  }
}
