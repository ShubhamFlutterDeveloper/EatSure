
import 'package:eatsure/deviceInfo.dart';
import 'package:eatsure/galleryImage.dart';
import 'package:eatsure/heroAnimation.dart';
import 'package:eatsure/imagePicker.dart';
import 'package:eatsure/interZoom.dart';
import 'package:eatsure/newRipple.dart';
import 'package:eatsure/refresh_indicator.dart';
import 'package:eatsure/rippleanimation.dart';
import 'package:eatsure/rotatetrans.dart';
import 'package:eatsure/scrollbar.dart';
import 'package:eatsure/tweenanimat.dart';
import 'package:eatsure/urlLauncher.dart';
import 'package:eatsure/verificationScreen.dart';
import 'package:eatsure/water%20wave.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'asocial_Task.dart';
import 'bottom_tabbar.dart';
import 'circlewave.dart';
import 'dragg_drop.dart';
import 'ev_project_task/ev_SplashScreen.dart';
import 'ev_project_task/ev_login_Screen.dart';
import 'evone_task.dart';
import 'expension_Panal.dart';
import 'flutter_slidable.dart';
import 'googlemap.dart';
import 'gridViewClass.dart';
import 'gridView_Task.dart';
import 'jsonEcoder.dart';
import 'list_View.dart';
import 'list_view_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "IBMPlexSansThai-Regular",
        primarySwatch: Colors.blue,
      ),
      home:
      BottomTabBarPage()
     // VideoApp()
      //EVLoginScreen()
      //EvSplashScreen()
      //RefreshIndicatorTask()
      //EvoneTask()
      //VerificationScreen(verificationId: 'fssfv',)
      //RipplesAnimation()
      //ExpansionPanal()
     //AsocialApp()
        //ListVieww()
        //ScrollBarEx()
      //JsonEcoder1()
      //DeviceInfo()
      //SongList()
    // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailcontroller =TextEditingController();
  final _passwordcontroller =TextEditingController();
  final _phoneVerificontroller =TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  void dispose(){
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:GestureDetector(
        onTap: (){

          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneVerificontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              auth.verifyPhoneNumber(
                  phoneNumber: "+91${_phoneVerificontroller.text}",
                  verificationCompleted: (_){},
                  verificationFailed: (e){},
                  codeSent: (String? verificationId,int? token){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => VerificationScreen(verificationId: 'verificationId',),));
                  },
              codeAutoRetrievalTimeout: (String verificationId) { }
              );
            },
                child:Text("Login with Phone"))
          ],
        )
      )
    );
  }
}
