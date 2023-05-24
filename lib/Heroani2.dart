import 'package:flutter/material.dart';

class HeroAnimation2 extends StatefulWidget {
  const HeroAnimation2({Key? key}) : super(key: key);

  @override
  State<HeroAnimation2> createState() => _HeroAnimation2State();
}

class _HeroAnimation2State extends State<HeroAnimation2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },

          child: Hero(
            tag: "hero",
            child: Image.asset('assets/wel.png',height: 200,),
          ),
        ),
      ),
    );
  }
}
