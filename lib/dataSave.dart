import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataSave extends StatefulWidget {
  const DataSave({Key? key}) : super(key: key);

  @override
  State<DataSave> createState() => _DataSaveState();
}

class _DataSaveState extends State<DataSave> {
  String savedData = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('savedData') ?? '';
    setState(() {
      savedData = data;
    });
  }

  Future<void> saveData(String newData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedData', newData);
    setState(() {
      savedData = newData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Saved Data:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              savedData,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String newData = 'Hello, World!';
                await saveData(newData);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Data Saved'),
                      content: Text('New data saved successfully!'),
                      actions: [
                        ElevatedButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}
