import 'package:flutter/material.dart';

class RefreshIndicatorTask extends StatefulWidget {
  const RefreshIndicatorTask({Key? key}) : super(key: key);

  @override
  State<RefreshIndicatorTask> createState() => _RefreshIndicatorTaskState();
}

class _RefreshIndicatorTaskState extends State<RefreshIndicatorTask> {
  int itemCount =2 ;
  bool isSelected=true;
  @override
  Widget build(BuildContext context) {
      return RefreshIndicator(
      edgeOffset: 1.0,
      displacement:60,
      backgroundColor: Colors.blue,
      color: Colors.white,
      strokeWidth: 2,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 10));
        setState(() {
          itemCount = itemCount+4;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Refresh Indicator'),
          backgroundColor: Colors.blueGrey,
        ),
        body: _buildCardDesign(),
      ),
    );
  }
  Widget _buildCardDesign() {
    return Container(
      child: ListView.builder(
          itemCount: itemCount,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return _buildCardView();
          }),
    );
  }
  Widget _buildCardView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:120,
      child: Container(
        margin: EdgeInsets.all(10),
        height:100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          //color: Colors.pinkAccent,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/S 20140830_230352.jpg'),

              ),
              //SizedBox(width: 20,),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Lord Shiva",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "MahaKal",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Devo Ke Dev MahaDev",
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "Shivva",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isSelected=!isSelected;

                      });
                      print("hjbhbh");

                    },
                    child: Container(
                      // height: 20,
                      // width: 20,
                      margin: EdgeInsets.only(left: 20),
                      //color: Colors.pinkAccent,
                      child:isSelected?Icon(Icons.star_border,color: Colors.yellow,)
                          :Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
