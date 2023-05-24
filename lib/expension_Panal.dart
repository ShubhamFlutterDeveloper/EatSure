import 'package:flutter/material.dart';

class ExpansionPanal extends StatefulWidget {
  const ExpansionPanal({Key? key}) : super(key: key);

  @override
  State<ExpansionPanal> createState() => _ExpansionPanalState();
}

class _ExpansionPanalState extends State<ExpansionPanal> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Expension Panal"),
),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionPanelList(
                expansionCallback: (index, isExpanded) {
                  setState(() {
                  });
                },
                animationDuration: Duration(seconds: 2),
                dividerColor: Colors.deepOrange,
                children: [
                  ExpansionPanel(headerBuilder:  (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Item 1'),
                    );
                  },

                  body: Container(
                    child: ListView.builder(
                      itemCount:1,
                      itemBuilder: (context, index) =>
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.none,
                        child: Image.asset('assets/wel.png',fit: BoxFit.fill),
                      ),
                      title: Text("Shivam"),
                      trailing:Icon(Icons.delete,color: Colors.black,),
                    )
                    ),
                  )
                  ),
            /*      ExpansionPanel(headerBuilder:  (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Item 1'),
                    );
                  },
                      body: ListView.builder(
                          itemCount: 4,

                          itemBuilder: (context, index) =>
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.none,
                                  child: Image.asset('assets/wel.png',fit: BoxFit.fill),
                                ),
                                title: Text("Shivam"),
                                trailing:Icon(Icons.delete,color: Colors.black,),
                              )
                      ),
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(headerBuilder:  (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Item 1'),
                    );
                  },
                      body: ListView.builder(
                          itemCount: 4,

                          itemBuilder: (context, index) =>
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.none,
                                  child: Image.asset('assets/wel.png',fit: BoxFit.fill),
                                ),
                                title: Text("Shivam"),
                                trailing:Icon(Icons.delete,color: Colors.black,),
                              )
                      )
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
