import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class MotionBottomTabBar extends StatefulWidget {
  const MotionBottomTabBar({Key? key}) : super(key: key);

  @override
  State<MotionBottomTabBar> createState() => _MotionBottomTabBarState();
}

class _MotionBottomTabBarState extends State<MotionBottomTabBar> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 1,
      length: 5,
      vsync:this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: tabController,
        children: <Widget>[
          Center(child: Text("Dashboard"),),
          Center(child: Text("Home"),),
          Center(child: Text("Add"),),
          Center(child: Text("Profile"),),
          Center(child: Text("Settings"),
          ),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Add",
        labels:  ["Dashboard", "Home", "Add", "Profile", "Settings"],
        icons:  [Icons.dashboard, Icons.home, Icons.add, Icons.people_alt, Icons.settings],
        tabSize: 55,
        tabBarHeight: 55,
        textStyle: TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.blue[600],
        tabIconSize: 30.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.blue[900],
        tabIconSelectedColor: Colors.white,
        tabBarColor:  Color(0xFFAFAFAF),
        onTabItemSelected: (int value) {
          setState(() {
            tabController!.index = value;
          });
        },
      ),
    );
  }
}
