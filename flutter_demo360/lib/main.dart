// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

// void main() {
//   SystemChrome.setEnabledSystemUIOverlays([]);
//   runApp(MyApp());

//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     systemNavigationBarColor: Colors.transparent, // navigation bar color
//     statusBarColor: Colors.transparent,
//     systemNavigationBarIconBrightness: Brightness.dark, // status bar color
//   ));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter VR',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           color: Colors.blue,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Row(),
//               Text(
//                 'Flutter VR',
//                 style: TextStyle(
//                   fontSize: 60,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold
//                 ),
//               ),
//               SizedBox(height: 20),
//               RaisedButton(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)),
//                 color: Colors.blue[800],
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Text(
//                     'ENTER',
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 onPressed: () => _launchURL(context),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _launchURL(BuildContext context) async {
//     try {
//       await launch(
//         // NOTE: Replace this URL with your GitHub Pages URL.
//         'https://mirolyubovn.github.io/react-360-flutter-test/',
//         customTabsOption: CustomTabsOption(
//           toolbarColor: Theme.of(context).primaryColor,
//           enableDefaultShare: true,
//           enableUrlBarHiding: true,
//           showPageTitle: false,
//           animation: CustomTabsSystemAnimation.slideIn(),
//           extraCustomTabs: const <String>[
//             // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
//             'org.mozilla.firefox',
//             // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
//             'com.microsoft.emmx',
//           ],
//         ),
//       );
//     } catch (e) {
//       // An exception is thrown if browser app is not installed on Android device.
//       debugPrint(e.toString());
//     }
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:video_360/video_360.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(home: MyApp()));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   late Video360Controller controller;

//   String durationText = '';
//   String totalText = '';

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {

//     var statusBar = MediaQuery.of(context).padding.top;

//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video 360 Plugin example app'),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: Container(
//               width: width,
//               height: height,
//               child: Video360View(
//                 onVideo360ViewCreated: _onVideo360ViewCreated,
//                 url: 'https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8',
//                 onPlayInfo: (Video360PlayInfo info) {
//                   setState(() {
//                     durationText = info.duration.toString();
//                     totalText = info.total.toString();
//                   });
//                 },
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   MaterialButton(
//                     onPressed: () {
//                       controller.play();
//                     },
//                     color: Colors.grey[100],
//                     child: Text('Play'),
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       controller.stop();
//                     },
//                     color: Colors.grey[100],
//                     child: Text('Stop'),
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       controller.reset();
//                     },
//                     color: Colors.grey[100],
//                     child: Text('Reset'),
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       controller.jumpTo(80000);
//                     },
//                     color: Colors.grey[100],
//                     child: Text('1:20'),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   MaterialButton(
//                     onPressed: () {
//                       controller.seekTo(-2000);
//                     },
//                     color: Colors.grey[100],
//                     child: Text('<<'),
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       controller.seekTo(2000);
//                     },
//                     color: Colors.grey[100],
//                     child: Text('>>'),
//                   ),
//                   Flexible(
//                     child: MaterialButton(
//                       onPressed: () {
//                       },
//                       color: Colors.grey[100],
//                       child: Text(durationText + ' / ' + totalText),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   _onVideo360ViewCreated(Video360Controller controller) {
//     this.controller = controller;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:video_player_360/video_player_360.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('360 Video Player Flutter'),
//         ),
//         body: Center(
//           child: RaisedButton(
//             onPressed: () async {
//               await VideoPlayer360.playVideoURL(
//                   "https://github.com/stephangopaul/video_samples/blob/master/gb.mp4?raw=true");
//             },
//             child: Text("Click to play Video URL"),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:video_player_extra/video_player.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(VideoApp());
//
// class VideoApp extends StatefulWidget {
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     VideoPlayerController = VideoPlayerController.network(
//       'https://videojs-vr.netlify.app/samples/eagle-360.mp4',
//       videoPlayerOptions: VideoPlayerOptions(
//         mixWithOthers: true,
//         mediaFormat: MediaFormat.VR2D360,
//       ),
//     )..initialize().then((_) {
//       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player_extra/video_player_extra.dart';

void main() {
  runApp(
    MaterialApp(
      home: _App(),
    ),
  );
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey<String>('home_page'),
      appBar: AppBar(
        title: const Text('Video player example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _BumbleBeeRemoteVideo(url: 'https://videojs-vr.netlify.app/samples/eagle-360.mp4', mediaFormat: MediaFormat.VR2D360),
          ],
        ),
      ),
    );
  }
}

class _BumbleBeeRemoteVideo extends StatefulWidget {
  final String url;
  final int mediaFormat;

  _BumbleBeeRemoteVideo({
    Key? key,
    required this.url,
    required this.mediaFormat,
  }) : super(key: key);

  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

double _cameraPitch = 0;
double _cameraYaw = 0;

class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> {
  late VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.url,
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
        mediaFormat: widget.mediaFormat,
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          const Text('With remote mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller}) : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  static const _mediaFormats = {
    MediaFormat.STANDARD: "Standard",
    MediaFormat.VR2D180: "Monoscopic 180",
    MediaFormat.VR2D360: "Monoscopic 360",
    MediaFormat.VR3D180_OU: "Stereoscopic 180 OverUnder",
    MediaFormat.VR3D180_SBS: "Stereoscopic 180 SideBySide",
    MediaFormat.VR3D360_OU: "Stereoscopic 360 OverUnder",
    MediaFormat.VR3D360_SBS: "Stereoscopic 360 SideBySide",
  };

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
          onPanUpdate: (details) {
            double touchX = details.delta.dx;
            double touchY = details.delta.dy;
            double r = 0;
            double cr = cos(r);
            double sr = sin(r);
            _cameraYaw -= cr * touchX - sr * touchY;
            _cameraPitch += sr * touchX + cr * touchY;
            _cameraPitch = max(-45, min(45, _cameraPitch));
            controller.setCameraRotation(0.0, _cameraPitch, _cameraYaw);
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) {
              return [
                for (final speed in _examplePlaybackRates)
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<int>(
            initialValue: controller.value.mediaFormat,
            tooltip: 'Switch between media format',
            onSelected: (format) {
              controller.setMediaFormat(format);
            },
            itemBuilder: (context) {
              return [
                for (var keyvalue in _mediaFormats.entries)
                  PopupMenuItem(
                    value: keyvalue.key,
                    child: Text(keyvalue.value),
                  ),
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(_mediaFormats[controller.value.mediaFormat]!),
            ),
          ),
        ),
      ],
    );
  }
}