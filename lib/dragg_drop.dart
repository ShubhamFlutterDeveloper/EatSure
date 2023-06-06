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
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController videocontroller;
  late AnimationController _animationcontroller;
  Animation? animation;
  double animationDoublevalue = 0.0;

  @override
  void dispose() {
    super.dispose();
    videocontroller.dispose();
    _animationcontroller.dispose();
  }

  @override
  void initState() {
    super.initState();
    videocontroller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        videocontroller.setLooping(true);
        videocontroller.play();
        setState(() {});
      });
    _animationcontroller = AnimationController(duration: Duration(milliseconds: videocontroller.value.duration.inMilliseconds),vsync: this);
    animation = Tween(begin: 0.0, end:videocontroller.value.duration.inMilliseconds).animate(CurvedAnimation(parent: _animationcontroller, curve: Curves.linear))
      ..addListener(() {
        setState(() {
          animationDoublevalue = double.parse(animation?.value.toString() ?? '');
        });
      });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: videocontroller.value.size.width,
                  height: videocontroller.value.size.height,
                  child: VideoPlayer(videocontroller),
                ),
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
                      videocontroller.value.isPlaying ? _animationcontroller.forward(): _animationcontroller.reset();
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
    );
  }
}
