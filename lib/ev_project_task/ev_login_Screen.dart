import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'ev_Register_Screen.dart';
import 'ev_Task_Response/ev_login_response.dart';

class EVLoginScreen extends StatefulWidget {
  const EVLoginScreen({Key? key}) : super(key: key);

  @override
  State<EVLoginScreen> createState() => _EVLoginScreenState();
}

class _EVLoginScreenState extends State<EVLoginScreen> {
  Dio dio= Dio();
  final _formkey = GlobalKey<FormState>();
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PassController = new TextEditingController();
  bool obscureText = false;
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscureText=true;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child:EvloginScreen()
            ),
          ),
        ),
      ),
    );
  }
  Widget EvloginScreen(){
    return  Column(
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Container(
              height: 250,
              width: 250,
              child: Image.asset('assets/AW-06 1.png',fit: BoxFit.fill,)),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15),
          child: Text('Log In',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w700,)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Text('Email',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.emailAddress,
            controller: EmailController,
            // obscureText: true,
            validator: (value) {
              if (value?.isEmpty == true) {
                return 'Enter Correct Email';
              }
              return null;
            },
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12,top: 10),
          child: Row(
            children: [
              Text('Password',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: TextFormField(
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.emailAddress,
            controller: PassController,
            obscureText: obscureText,
            // obscureText: true,
            validator: (value) {
              if (value?.isEmpty == true) {
                return 'Enter Correct Password';
              }
              return null;
            },
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: 'password',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                child: Icon(
                  obscureText == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 25),
          child: SizedBox(
            width: 330,
            height: 60,
            child: ElevatedButton(
              onPressed: ()async{
                setState(() {
                  loading = true;
                });
                getLoginApi();
                /* var tokenGet =  await  pref.getString(DuabaSplashState.tokenkeyValue);
                               print("token get ${tokenGet}");*/
                /*  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                              ));*/
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff09B0D9),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(40)),
              ),
              child: loading
                  ? CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              )
                  : Text(
                'LogIn',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(height:15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot your password ?',
              style: TextStyle(
                  color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: "Don't",
                  style: TextStyle(color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                        text: ' have an account ?',
                        style: TextStyle(fontSize: 15)),
                    /*  TextSpan(
                                          text: 'Register',
                                          style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                                        ),*/
                  ],
                ),
              ),
              SizedBox(
                width: 9,
              ),
              InkWell(
                onTap: () {
                Get.to(EvRegisterScreen());
                },
                child: Text('Register',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration:
                        TextDecoration.underline)),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Future getLoginApi() async {
    try {
      var response = await dio.post('http://easy.deploywork.com:4360/app/auth/login',
          data: LoginRequest(
            email: EmailController.text,
            password: PassController.text,
            deviceToken: "aaaaaaaa",
            deviceType: "oppo",
          ),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      print("request response ${response.statusCode}");
      print(response.data.toString());
      if(response.statusCode==200){
        setState(() {
          loading=false;
        }
        );
      }else{
        setState(() {
          loading=false;
        });
      }
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
