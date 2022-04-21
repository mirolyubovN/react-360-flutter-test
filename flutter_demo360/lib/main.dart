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

import 'package:flutter/material.dart';
import 'package:video_player_360/video_player_360.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('360 Video Player Flutter'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              await VideoPlayer360.playVideoURL(
                  "https://github.com/stephangopaul/video_samples/blob/master/gb.mp4?raw=true");
            },
            child: Text("Click to play Video URL"),
          ),
        ),
      ),
    );
  }
}