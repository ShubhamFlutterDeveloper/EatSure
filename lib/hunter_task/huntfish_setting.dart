import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../helper _widgets/text_widget.dart';

class HuntingFlishSetting extends StatefulWidget {
  const HuntingFlishSetting({Key? key}) : super(key: key);

  @override
  State<HuntingFlishSetting> createState() => _HuntingFlishSettingState();
}

class _HuntingFlishSettingState extends State<HuntingFlishSetting> {
final interstController= TextEditingController();
final experienceController= TextEditingController();
final locationController= TextEditingController();
final equipController= TextEditingController();
final prefController= TextEditingController();
final regulController= TextEditingController();
final physicalController= TextEditingController();
final seasonController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading:Padding(
          padding:EdgeInsets.only(left: 3.7.w,top:0.2.h,bottom: 1.7.h),
          child: Container(
            padding: EdgeInsets.all(12.0),
            height:6.h,
            width: 14.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:Colors.white.withOpacity(0.5),),
            child: Image.asset('assets/Vector (1).png'),
          ),
        ),
        title: TextWidget(text: "Huntfish Ai Settings", size:20.sp, bold:FontWeight.bold,color:Colors.white,),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: 2.w,right: 2.w),
        child: ListView(
          children: [
            SizedBox(height: 1.h,),
            Text('Interests',style: TextStyle(fontSize:16.sp, fontWeight:FontWeight.bold,color:Colors.white,),),
            Container(
                height: 7.5.h,
                child:TextFormField(
                  style: TextStyle(color: Colors.white60),cursorColor: Colors.white,
                  controller:interstController ,
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(color:Color(0xffADADAD)),
                    fillColor:  Colors.grey.shade600,
                    filled: true,
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                  ),
                )
            ),
            SizedBox(height: 0.5.h,),
            Text('Experience',style: TextStyle(fontSize:16.sp, fontWeight:FontWeight.bold,color:Colors.white,),),
            Container(
                height: 7.5.h,
                child:TextFormField(
                  style: TextStyle(color: Colors.white60),cursorColor: Colors.white,
                  controller:experienceController ,
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(color:Color(0xffADADAD)),
                    fillColor:  Colors.grey.shade600,
                    filled: true,
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                  ),
                )
            ),
            SizedBox(height: 0.5.h,),
            Text('Location',style: TextStyle(fontSize:16.sp, fontWeight:FontWeight.bold,color:Colors.white,),),
            Container(
                height: 7.5.h,
                child:TextFormField(
                  style: TextStyle(color: Colors.white60),cursorColor: Colors.white,
                  controller:locationController ,
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(color:Color(0xffADADAD)),
                    fillColor:  Colors.grey.shade600,
                    filled: true,
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                  ),
                )
            ),
            SizedBox(height: 0.5.h,),
            Text('Equipment',style: TextStyle(fontSize:16.sp, fontWeight:FontWeight.bold,color:Colors.white,),),
            Container(
                height: 7.5.h,
                child:TextFormField(
                  style: TextStyle(color: Colors.white60),cursorColor: Colors.white,
                  controller:equipController ,
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(color:Color(0xffADADAD)),
                    fillColor:  Colors.grey.shade600,
                    filled: true,
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                  ),
                )
            ),
            SizedBox(height: 0.5.h,),
            Text('Preferences',style: TextStyle(fontSize:16.sp, fontWeight:FontWeight.bold,color:Colors.white,),),
            Container(
                height: 7.5.h,
                child:TextFormField(
                  style: TextStyle(color: Colors.white60),cursorColor: Colors.white,
                  controller:prefController ,
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(color:Color(0xffADADAD)),
                    fillColor:  Colors.grey.shade600,
                    filled: true,
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                  ),
                )
            ),
            SizedBox(height: 0.5.h,),
            Text('Regulatory Understanding',style: TextStyle(fontSize:16.sp, fontWeight:FontWeight.bold,color:Colors.white,),),
            Container(
                height: 7.5.h,
                child:TextFormField(
                  style: TextStyle(color: Colors.white60),cursorColor: Colors.white,
                  controller:regulController ,
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(color:Color(0xffADADAD)),
                    fillColor:  Colors.grey.shade600,
                    filled: true,
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                  ),
                )
            ),
            SizedBox(height: 0.5.h,),
            Text('Physical Capabilities',style: TextStyle(fontSize:16.sp, fontWeight:FontWeight.bold,color:Colors.white,),),
            Container(
                height: 7.5.h,
                child:TextFormField(
                  style: TextStyle(color: Colors.white60),cursorColor: Colors.white,
                  controller:physicalController ,
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(color:Color(0xffADADAD)),
                    fillColor:  Colors.grey.shade600,
                    filled: true,
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                  ),
                )
            ),
            SizedBox(height: 0.5.h,),
            Text('Season',style: TextStyle(fontSize:16.sp, fontWeight:FontWeight.bold,color:Colors.white,),),
            Container(
                height: 7.5.h,
                child:TextFormField(
                  style: TextStyle(color: Colors.white60),cursorColor: Colors.white,
                  controller:seasonController ,
                  decoration: InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(color:Color(0xffADADAD)),
                    fillColor:  Colors.grey.shade600,
                    filled: true,
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                  ),
                )
            ),
            SizedBox(height: 3.h,),
            GestureDetector(
              onTap: (){
                print('vdsvv');
              },
              child: Container(
                height: 7.5.h,
                width: 2.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Color(0xffFFCE3C),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width:16.w,),
                    TextWidget(text: "Submit", size:17.sp, bold:FontWeight.bold,color:Colors.black,alignment: TextAlign.center,),
                    Padding(
                      padding: EdgeInsets.only(right: .5.h),
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        height:6.2.h,
                        width: 14.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:Colors.white,),
                        child: Image.asset('assets/Vector (2).png'),
                      ),
                    ),
                  ],
                ),  
              ),
            )
        ]
        ),
      )
    );
  }
}


