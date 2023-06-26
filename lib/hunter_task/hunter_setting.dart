import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../helper _widgets/text_widget.dart';

class HunterSetting extends StatefulWidget {
  const HunterSetting({Key? key}) : super(key: key);

  @override
  State<HunterSetting> createState() => _HunterSettingState();
}

class _HunterSettingState extends State<HunterSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Row(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset('assets/Group 118.svg')),
              TextWidget(text: "Settings", size:20, bold:FontWeight.bold,color: Colors.white,)
            ],
          ),
          Container(
            height:60.h,
            width: 10,
            color: Colors.red,
          )

        ],
      ),
    );
  }
}
