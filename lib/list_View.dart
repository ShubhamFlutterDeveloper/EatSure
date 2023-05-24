import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'get_Intereste_Data.dart';

class ListVieww extends StatefulWidget {
  const ListVieww({Key? key}) : super(key: key);

  @override
  State<ListVieww> createState() => _ListViewwState();
}

class _ListViewwState extends State<ListVieww> {
  Dio dio = Dio();
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyDetailsApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: interestList.body?.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 108,
              color: Colors.black,
              width: 500,
              child: Column(
                children: [
                  Center(child: Text(interestList.body?[index].name??" dd",style: TextStyle(color: Colors.red),))
                ],
              ),
            );
          }),
    );
  }

  InterestList interestList = InterestList();

  Future<void> getMyDetailsApi() async {
    var response = await dio.get(
        'http://asocial.deploywork.com:4359/api/v1/auth/intrests-list');
    var getMyDetailsResponse = InterestList.fromJson(response.data);
    if (getMyDetailsResponse.code == 200) {
      print("SUCCESS:::${response.data}");
    }else {
      print(response.statusCode);
    }
  }
}