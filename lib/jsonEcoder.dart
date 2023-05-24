import 'dart:convert';

import 'package:flutter/material.dart';

import 'dummyJson.dart';

class JsonEcoder1 extends StatefulWidget {
  const JsonEcoder1({Key? key}) : super(key: key);

  @override
  State<JsonEcoder1> createState() => _JsonEcoder1State();
}

class _JsonEcoder1State extends State<JsonEcoder1> {

  @override
  Widget build(BuildContext context) {
    var  jsondd=jsonEncode(Dummy.forms[0]["duaba"]["main"]);
    print(jsondd);
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON DATA'),
      ),
      body: Scaffold(
        body: ListView.builder(
          itemCount:2,
        itemBuilder: (BuildContext context, int index) {
            return Container(
          child: Text(' ${Dummy.forms[0]["duaba"]["main"][index]["pass"]}',
              style: TextStyle(fontSize: 20,color: Colors.black)
          ),
        ); },
        ),
      ),
    );
  }
}
