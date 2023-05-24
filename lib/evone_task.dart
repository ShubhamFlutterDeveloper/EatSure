import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Evone_response.dart';

class EvoneTask extends StatefulWidget {
  const EvoneTask({Key? key}) : super(key: key);

  @override
  State<EvoneTask> createState() => _EvoneTaskState();
}

class _EvoneTaskState extends State<EvoneTask> {
  Dio dio =Dio();
  Evone evone=Evone();
  List<Body> evoneList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEvonDetailsApi();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.cyan,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
              itemCount: evone.body?.length??0,
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              if(evoneList.any((element) => element.id==evone.body![index].id)){
                                evoneList.removeWhere((element) => element.id==evone.body![index].id);
                              }else{
                                evoneList.add(evone.body![index]);
                              }
                            });

                            print("ID-->${evone.body?[index].id}");
                            print("Status-->${evone.body?[index].status}");
                          },
                          child: Text("${evone.body?[index].name}",style: TextStyle(fontSize: 20,
                              color:evoneList.any((element) => element.id==evone.body![index].id)?Colors.pink:Colors.white ),)),
                    ),
                  ],
                );
              },
              ),

              SizedBox(
                height: 50,
              ),
              evoneList.isNotEmpty?  ListView.builder(
                shrinkWrap: true,
                itemCount: evoneList.length,
                itemBuilder: (context, index) {
                  return  Text("${evoneList[index].name}",style: TextStyle(fontSize: 20),);
                },):SizedBox.shrink()

            ],
          ),
        ),
      ),
    );
  }
  var token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjo5LCJlbWFpbCI6Im1hbm9qQHlvcG1haWwuY29tIn0sImlhdCI6MTY4MjQwNDY1NCwiZXhwIjoxNjg0OTk2NjU0fQ.zucLrreHiG-c00ZucqNJolj5w6vXjUGPXuEERy9qAl0';
  Future<void> getEvonDetailsApi() async {
    var response = await dio.get('http://easyv.deploywork.com:4360/app/station/getConnectors',
    options: Options(
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'authorization': 'Bearer $token',
      }
    ));
    evone = Evone.fromJson(response.data);
    if(evone.code == 200) {
      print("SUCCESS:::${response.data}");
      setState(() {
        print('success----->>>>${evone.body?.length}');
      });

    }
  }
}
