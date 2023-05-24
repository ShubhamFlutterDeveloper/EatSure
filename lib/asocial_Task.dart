import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'get_Intereste_Data.dart';

class AsocialApp extends StatefulWidget {
  const AsocialApp({Key? key}) : super(key: key);

  @override
  State<AsocialApp> createState() => _AsocialAppState();
}

class _AsocialAppState extends State<AsocialApp> {
  Dio? dio;
  InterestList interestsList=InterestList();
  @override
  void initState() {
    dio = Dio();
    getMyDetailsApi();
  //  print('name>>>>>>>${interestList.body?.first.name}');
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink[300],
        body: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Container(
            height: double.infinity,
            padding: EdgeInsets.only(top:15),
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10,top: 40),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Your Interests",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10,top:8),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Pick up to 5 things you Love',style: TextStyle(fontSize:15,color: Colors.grey),)),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: interestsList.body?.length ?? 0,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left:10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${interestsList.body?[index].name}",style: TextStyle(fontSize: 20),),
                            GridView.builder(
                              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:3,
                                  mainAxisSpacing: 3,
                                  childAspectRatio: 5/2),
                              padding: EdgeInsets.all(8),
                              itemCount:interestsList.body?[index].intrestList?.length ?? 0,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int i) {
                                return InkWell(
                                  onTap: (){

                                    setState(() {
                                      if(interestsList.body?[index].intrestList?[i].isSelected == true) {
                                        interestsList.body?[index].intrestList?[i].isSelected = false;
                                        print('notselected');
                                      }else{
                                        interestsList.body?[index].intrestList?[i].isSelected = true;
                                        print('isselected');
                                      }
                                    });

                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                    //    gradient: LinearGradient(colors: [Colors.pink.shade300,Colors.purple.shade300]),

                                      gradient: interestsList.body?[index].intrestList?[i].isSelected == true?LinearGradient(
                                        colors: [Color(0xffff99b6),Color(0xffdd5ce9)])
                                          :LinearGradient(
                                          colors: [Color(0xffe5dde6),Color(0xffe5dde6)])
                                      ),
                                      child: Center(child:
                                      Text("${interestsList.body?[index].intrestList?[i].name}",
                                        style: TextStyle(fontSize: 15),))),
                                );

                              },
                            ),
                            index != ((interestsList.body?.length ?? 0) - 1) ? Divider(height: 40, color: Colors.grey[200], thickness: 5, endIndent:5,)
                                : SizedBox.shrink(),
                          ],
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60,right:10),
                        child: Container(
                          height:1,
                          width: 100,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Text('OR',style: TextStyle(fontSize: 20),),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right:50),
                        child: Container(
                          height:1,
                          width: 100,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20),side: BorderSide(color: Colors.pink.shade300)),
                          ),
                          onPressed: () {},
                          child:Text('Enter your own',style: TextStyle(fontSize: 20,color: Colors.pink.shade300),)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25,bottom: 50),
                    child:InkWell(
                      onTap: (){
                        print("sfvsfv");
                      },
                      child: Container(
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            gradient:  LinearGradient(
                                colors: [Color(0xffff99b6),Color( 0xffdd5ce9)])
                        ),
                        child: Center(child: Text('Next',style: TextStyle(fontSize: 20,color: Colors.white))),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  Future<void> getMyDetailsApi() async {
    var response = await dio?.get('http://asocial.deploywork.com:4359/api/v1/auth/intrests-list');
     interestsList = InterestList.fromJson(response?.data);
    if(interestsList.code == 200) {
      print("SUCCESS:::${response?.data}");
      setState(() {
        print('success----->>>>${interestsList.body?.length}');
      });

    }
    }
}
