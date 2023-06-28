import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'ev_Task_Response/sigin_Requestapi.dart';
import 'ev_login_Screen.dart';
import 'package:http/http.dart' as http;

class EvRegisterScreen extends StatefulWidget {
  const EvRegisterScreen({Key? key}) : super(key: key);

  @override
  State<EvRegisterScreen> createState() => _EvRegisterScreenState();
}

class _EvRegisterScreenState extends State<EvRegisterScreen> {
  Dio dio = Dio();
  final _globalformkey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
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
            key: _globalformkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
                child:EvregisterScreen()
            ),
          ),
        ),
      ),
    );
  }
  Widget EvregisterScreen(){
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
          child: Text('Register',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w700,)),
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
            autofocus: true,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
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
              Text('Phone Number',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: TextFormField(
            autofocus: true,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.phone,
            controller: phoneController,
            // obscureText: true,
            validator: (value) {
              if (value?.isEmpty == true) {
                return 'Enter Correct Phone Number';
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
              hintText: 'phone number',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.phone_outlined,
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
            autofocus: true,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.emailAddress,
            controller: passController,
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
        SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child:loading
              ? CircularProgressIndicator(
            color: Colors.blue,
            strokeWidth: 3,
          )
              : SizedBox(
            width: 330,
            height: 60,
            child: ElevatedButton(
              onPressed: ()async{
                setState(() {
                  loading=false;
                });
                if (_globalformkey.currentState!.validate()) {
                  _globalformkey.currentState!.save();
                }
                postSignIn();
                /* var tokenGet =  await  pref.getString(DuabaSplashState.tokenkeyValue);
                               print("token get ${tokenGet}");*/
                 /* Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>EVLoginScreen()
                              ));*/
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff09B0D9),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(40)),
              ),
              child:  Text(
                'Register',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
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
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  EVLoginScreen(),
                                ));
                },
                child: Text('Login',
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
  /*Future evPostSignIn()async {
    try {
      var response = await dio.post('http://easy.deploywork.com:4360/app/auth/signup',
          data: SignupRequest(
              email: emailController.text,
              phone: phoneController.text,
              password: passController.text,
              deviceToken: "deviceToken",
              deviceType: "deviceType"
          ),
          options: Options(
              headers: {
                'Content-Type': 'application/json',
              }
          )
      );
      print(response.data);
    }
    catch(e){
      print(e.toString());
    }return null;
  }*/
   postSignIn()async {
    var request=SignupRequest(
      email: emailController.text,
      phone: phoneController.text,
      password: passController.text,
      deviceToken: "deviceToken",
      deviceType: "deviceType"
    );
    print("request:::${request.toJson()}");
      final response = await dio.post("http://easy.deploywork.com:4360/app/auth/signup",
          data: request,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ));
      print(response.data);
      if (response.statusCode == 200) {
        setState(() {
          loading = false;
        }
        );
      } else {
        setState(() {
          loading = false;
        });
      }
  }
 /* Future<void> postSignInHttp()async {
    var request=SignupRequest(
      email: emailController.text,
      phone: phoneController.text,
      password: passController.text,
      deviceToken: "deviceToken",
      deviceType: "deviceType"
    );
    print("request:::${request.toJson()}");
    try {
      final response = await dio.post("http://easy.deploywork.com:4360/app/auth/signup",
          data: request,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ));
      print(response.data);
      if (response.statusCode == 200) {
        setState(() {
          loading = false;
        }
        );
      } else {
        setState(() {
          loading = false;
        });
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }*/
}
