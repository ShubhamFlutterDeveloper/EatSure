import 'package:flutter/material.dart';

class ScrollBarEx extends StatefulWidget {
  const ScrollBarEx({Key? key}) : super(key: key);

  @override
  State<ScrollBarEx> createState() => _ScrollBarExState();
}

class _ScrollBarExState extends State<ScrollBarEx> {
  bool _isAlwaysShown = true;

  bool _showTrackOnHover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollbar Demo' ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Scrollbar(
              //thumbVisibility: _isAlwaysShown,
              trackVisibility: _showTrackOnHover,
           thickness: 5.0,
              interactive:true,

              radius: Radius.circular(10),
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) => MyItem(index),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
class MyItem extends StatelessWidget {
  final int index;

  const MyItem(this.index);

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[index % Colors.primaries.length];
    final hexRgb = color.shade500.toString().substring(10, 16).toUpperCase();
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          leading: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: color,
              )),
          title: Text('Material Color #${index + 1}'),
          subtitle: Text('#$hexRgb'),
        ),
        Divider(
          height: 10.0,
          color: Colors.black,
          thickness:3.0,
        )
      ],
    );
  }
}