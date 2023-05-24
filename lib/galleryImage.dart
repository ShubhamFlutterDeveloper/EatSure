import 'dart:io';

import 'package:flutter/material.dart';

class GalleryImage extends StatefulWidget {
  const GalleryImage({Key? key}) : super(key: key);

  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Image Demo'),
      ),
      body: Center(
        child: new Container(
          height: 200,
          width: 300,
          color: Colors.grey,
          child:Image.file(
              new File('/Phone storage/DCIM/Camera')),
        ),
      ),
    );
  }
}
