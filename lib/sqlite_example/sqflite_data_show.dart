import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'db_handler.dart';
import 'modal_Class.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late DatabaseHelper dbHelper;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  bool isEditing = false;
  late User _user;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    dbHelper.initDB().whenComplete(() async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Sqflite"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child:Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Form(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        hintText: 'Enter your name', labelText: 'Name'),
                                  ),
                                  TextFormField(
                                    controller: ageController,
                                    keyboardType: TextInputType.number,
                                   /* inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],*/
                                    decoration:  InputDecoration(
                                        hintText: 'Enter your age', labelText: 'Age'),
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: 'Enter your email',
                                        labelText: 'Email'),
                                  ),
                                  SizedBox(height: 30,),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                       height: 50,
                                        width: 350,
                                        child: ElevatedButton(
                                          child: Text('Submit'),
                                          onPressed: addOrEditUser,
                                        )),
                                  )
                                ]
                            )
                        )
                    ),
                    Expanded(
                      flex: 1,
                      child: SafeArea(
                          child: userWidget()
                      ),
                    )
                  ],
                )),
          ],
        )
    );
  }
  Future<void> addOrEditUser() async {
    String email = emailController.text;
    String name = nameController.text;
    String age = ageController.text;

    if (!isEditing) {
      User user =  User(name: name, age: int.parse(age), email: email);
      await addUser(user);
    } else {
      _user.email = email;
      _user.age = int.parse(age);
      _user.name = name;
      await updateUser(_user);
    }
    resetData();
    setState(() {});
  }

  Future<int> addUser(User user) async {
    return await dbHelper.insertUser(user);
  }

  Future<int> updateUser(User user) async {
    return await dbHelper.updateUser(user);
  }

  void resetData() {
    nameController.clear();
    ageController.clear();
    emailController.clear();
    isEditing = false;
  }
  Widget userWidget() {
    return FutureBuilder(
      future:dbHelper.retrieveUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, position) {
                return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(Icons.delete_forever),
                    ),
                    key: UniqueKey(),
                    onDismissed: (DismissDirection direction) async {
                      await dbHelper.deleteUser(snapshot.data![position].id!);
                    },
                    child:  GestureDetector(
                      onTap: () => populateFields(snapshot.data![position]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                                    child: Text(
                                      snapshot.data![position].name,
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      snapshot.data![position].email.toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                          BorderRadius.circular(100)),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data![position].age
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 2.0,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ));
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
  void populateFields(User user) {
    _user = user;
    nameController.text = _user.name;
    ageController.text = _user.age.toString();
    emailController.text = _user.email;
    isEditing = true;
  }
}
