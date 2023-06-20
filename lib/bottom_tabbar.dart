import 'package:eatsure/scrollbar.dart';
import 'package:flutter/material.dart';

import 'heroAnimation.dart';
import 'imagePicker.dart';
import 'list_View.dart';

class BottomTabBarPage extends StatefulWidget {
  const BottomTabBarPage({Key? key}) : super(key: key);

  @override
  State<BottomTabBarPage> createState() => _BottomTabBarPageState();
}

class _BottomTabBarPageState extends State<BottomTabBarPage> with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TabController(length:4 , vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          HeroAnimation1(),
          ImagePickerTutorial(),
          ListVieww(),
          ScrollBarEx()
      ],

      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.red,
        indicatorPadding: EdgeInsets.all(5.0),
        controller:controller,
        tabs: [
          Tab(icon: Icon(Icons.search_rounded,color: Colors.black,),text:"vv",iconMargin:EdgeInsets.all(5.0) ),
          Tab(icon: Icon(Icons.person,color: Colors.black,),text: "Profile",),
          Tab(icon: Icon(Icons.add,color: Colors.black,),text: "Add",),
          Tab(icon: Icon(Icons.flash_on_outlined,color: Colors.black,),text: "Flash",),
        ],
      ),
    );
  }
}
