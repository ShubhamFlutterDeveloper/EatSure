import 'package:eatsure/Heroani2.dart';
import 'package:flutter/material.dart';

class HeroAnimation1 extends StatefulWidget {
  const HeroAnimation1({Key? key}) : super(key: key);

  @override
  State<HeroAnimation1> createState() => _HeroAnimation1State();
}

class _HeroAnimation1State extends State<HeroAnimation1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, PageRouteBuilder(
                  //transitionDuration: Duration(seconds: 3),
                  pageBuilder:(context, animation, secondaryAnimation) => HeroAnimation2()));
            },
            child: Hero(
               tag: "hero",
              child: Image.asset('assets/wel.png',height:100,width: 100,),
            ),
          ),
        ],
      )
    );
  }


}
