/*
import 'package:flutter/material.dart';

class DragDropTask extends StatefulWidget {
  const DragDropTask({Key? key}) : super(key: key);

  @override
  State<DragDropTask> createState() => _DragDropTaskState();
}

class _DragDropTaskState extends State<DragDropTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(color: Colors.red,
          width: double.infinity,
          height: double.infinity,
          child:Image.asset("assets/loin.jpg",fit: BoxFit.fill,),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Draggable<String>(
                      onDragCompleted: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Delete Image'),
                              duration: Duration(seconds: 2),
                              action: SnackBarAction(label: 'undo',
                                onPressed: () {
                                },
                              ),
                            )
                        );
                      },
                      data: 'red',
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      feedback: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                          color: Colors.white,
                        ),
                      ),
                      childWhenDragging: Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'galleryImage.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> with SingleTickerProviderStateMixin {
   VideoPlayerController? videocontroller;
   AnimationController? _animationcontroller;
  Animation? animation;
  Animation<double>? _curve;
  double animationDoublevalue=0.0 ;

   late ConfettiController _centerController;
  @override
  void initState() {
    super.initState();
    _centerController = ConfettiController(duration:  Duration(seconds:20));
    _centerController.play();
    videocontroller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
       // videocontroller?.setLooping(true);
        videocontroller?.play();
        setState(() {});
      });
    _animationcontroller = AnimationController(duration: Duration(milliseconds: videocontroller?.value.duration.inMilliseconds??0),vsync: this);
    _curve=CurvedAnimation(parent: _animationcontroller!, curve: Curves.linear);
    animation = Tween(begin: 0.0, end:300).animate(_curve!)..addListener(() {
        setState(() {
          animationDoublevalue = double.parse(animation?.value.toString() ?? '');
          print('value print-->$animationDoublevalue');
        });
      });
    _animationcontroller?.reset();
    videocontroller?.addListener(() {
      setState(() {});
    });
  }
   @override
   void dispose() {
     super.dispose();
     videocontroller?.dispose();
     _animationcontroller?.dispose();
     _centerController.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video Demo',
        home: Scaffold(
          body: Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: videocontroller?.value.size.width,
                    height: videocontroller?.value.size.height,
                    child: VideoPlayer(videocontroller!),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: ConfettiWidget(
                  confettiController: _centerController,
                  blastDirection: pi / 2,
                 // blastDirectionality : BlastDirectionality.explosive,
                  particleDrag: 0.05,
                  maxBlastForce: 5,
                  minBlastForce: 1,
                  emissionFrequency: 0.03,
                  numberOfParticles: 10,
                  gravity: 0,
                  shouldLoop: true,
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 35,
                  child: Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 35,
                  child: Container(
                    height: 80,
                    width: animationDoublevalue,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffffcdd2),
                            Color(0xff42a5f5),
                          ],
                        )),
                  )),
              Positioned(
                  bottom: 20,
                  left: 40,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                       if(videocontroller?.value.position==videocontroller?.value.duration){
                         Get.to(GalleryImage);
                       }
                      });
                      print('hvvh');
                    },
                    child: Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        "Click here",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
