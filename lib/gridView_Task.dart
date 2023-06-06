import 'package:flutter/material.dart';

class GridVeiwTask extends StatefulWidget {
  const GridVeiwTask({Key? key}) : super(key: key);

  @override
  State<GridVeiwTask> createState() => _GridVeiwTaskState();
}

class _GridVeiwTaskState extends State<GridVeiwTask> {
  bool isSelected =false;
  List<String> imageList =[
    'assets/wel.png',
    'assets/music.jpg',
    'assets/fastfood.jpg',
    'assets/wel.png',
    'assets/download.jpg',
    'assets/wel.png',
    'assets/music.jpg',
    'assets/fastfood.jpg',
    'assets/wel.png',
    'assets/fastfood.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: GridView.builder(
        itemCount:imageList.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing:5,mainAxisSpacing:5),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onLongPress: () {
              setState(() {

              });
              if(isSelected){
                imageList.add(imageList[index]);
              }else{
                imageList.removeAt(index);
              }
              print('tapp');
              isSelected=true;
            },
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(imageList[index]),fit: BoxFit.cover)),
                ),
                Visibility(
                    visible: imageList.contains(index),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                    ))
              ],
            ),
          );
        },

      ),
    );
  }
}
