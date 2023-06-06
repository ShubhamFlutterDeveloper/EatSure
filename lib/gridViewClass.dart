/*
import 'dart:collection';
import 'package:flutter/material.dart';
class GridTwo extends StatefulWidget {
  GridTwo({Key? key}) : super(key: key);

  @override
  _GridTwoState createState() => _GridTwoState();
}

class _GridTwoState extends State<GridTwo> {
  List<String> imagePaths = [
    'assets/wel.png',
    'assets/music.jpg',
    'assets/fastfood.jpg',
    'assets/download.jpg',
  ];
  HashSet selectItems = new HashSet();
  bool isMultiSelectdItem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: isMultiSelectdItem ? IconButton(
              onPressed: () {
                setState(() {
                  isMultiSelectdItem = false;
                  selectItems.clear();
                });
              },
              icon: Icon(Icons.close)) : null,

          title: Text(isMultiSelectdItem ? getSelectedItemCount() : "Gridview Multi Selection"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  isMultiSelectdItem ?
              IconButton(onPressed: () {
                setState(() {
                });
               if(isMultiSelectdItem = true){

               }
                ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('Delete Image'),action: SnackBarAction(label: 'undo', onPressed: () {},),));
              }, icon:Icon(Icons.delete)):null,
            )
          ],
        ),
        body: GridView.builder(
            itemCount:imagePaths.length,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing:5,mainAxisSpacing:5),
            itemBuilder: (context, index) {
              return getGridItem(index);
            },)

    );
  }

  String getSelectedItemCount() {
    return selectItems.isNotEmpty ? selectItems.length.toString() + " item selected" : "No item selected";
  }

  void doMultiSelection(int index) {
    if (isMultiSelectdItem) {
      setState(() {
        if (selectItems.contains(index)) {
          selectItems.remove(index);
        } else {
          selectItems.add(index);
        }
      });
    } else {
    }
  }

  GridTile getGridItem(int index) {
    return GridTile(
      child: InkWell(
        onTap: (){
          doMultiSelection(index);
        },
        onLongPress: () {
          isMultiSelectdItem = true;
          doMultiSelection(index);
        },
        child: Stack(
          children: [
            Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(imagePaths[index]),fit: BoxFit.fill),
                color:Colors.black.withOpacity(selectItems.contains(index) ? 1 : 0),),

            ),
            Visibility(
                visible: selectItems.contains(index),
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
      ),
    );
  }
}*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryImageSelection extends StatefulWidget {
  const GalleryImageSelection({Key? key}) : super(key: key);

  @override
  State<GalleryImageSelection> createState() => _GalleryImageSelectionState();
}

class _GalleryImageSelectionState extends State<GalleryImageSelection> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;
  List<XFile>? selectItems = [];
  void slectedImage()async {
    try {
      final List<XFile> pickedFileList = await _picker.pickMultiImage();
      setState(() {
        _imageFileList = pickedFileList;
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
        actions: [
          IconButton(onPressed: () {
            slectedImage();
          }, icon:Icon(Icons.add)),
          SizedBox(width: 10,),
            IconButton(onPressed: () {
              print('tapp');
              selectItems?.forEach((element) {
                setState(() {
                  _imageFileList?.removeWhere((imagePath) => selectItems!.contains(imagePath));
                });
              });
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Delete Image'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(label: 'undo',
                    onPressed: () {
                      _imageFileList?.forEach((element) {
                        setState(() {
                          _imageFileList?.addAll(selectItems as Iterable<XFile>);
                        });
                      });
                    },
                  ),
                  )
              );
            }, icon: Icon(Icons.delete)),

        ],
      ),
      body: GridView.builder(
        itemCount: _imageFileList?.length??0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5),
        itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              doMultiSelection(index);
            });

          },
          onLongPress: () {
            setState(() {
             doMultiSelection(index);
            });

          },
          child: Stack(children: [
            Container(
             // color:selectItems?.any((element) => element==_imageFileList![index])==true?Colors.blue:Colors.black,
        color:Colors.black.withOpacity(selectItems?.any((element) => element==_imageFileList![index])==true ? 1 : 0),
              height: 150,
              width: 200,
              child: Image.file(File(_imageFileList![index].path)),
            ),
            Visibility(
                visible:selectItems?.any((element) => element==_imageFileList![index])==true,
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
      },),
    );
  }
  void doMultiSelection(index) {
    if (selectItems?.any((element) =>element == _imageFileList![index]) == true) {
      print("Already Exist");
      selectItems?.remove(_imageFileList![index]);
    } else {
      selectItems?.add(_imageFileList![index]);
    }
  }
  }
