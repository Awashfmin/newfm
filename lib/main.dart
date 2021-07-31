// @dart=2.9
import 'package:audioplayers/audioplayers.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:newfm/Radio.dart';
import 'package:newfm/screen/AboutUs.dart';
import 'package:newfm/screen/WebView.dart';

// import 'webjson.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer audioPlayer = AudioPlayer();

  String url = 'https://stream.zeno.fm/qh9v7bmw3tzuv.aac';

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    audioPlayer.setUrl(
        url); // Triggers the onDurationChanged listener and sets the max duration string
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  /// Compulsory
  playMusic() async {
    // Add the parameter "isLocal: true" if you want to access a local file
    await audioPlayer.play(url);
  }

  /// Compulsory
  pauseMusic() async {
    await audioPlayer.pause();
  }

  stopMusic() async {
    await audioPlayer.stop();
  }

  /// Optional
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer
        .seek(newPos); // Jumps to the given position within the audio file
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(text: "የቀጥታ ስርጭት"),
                  Tab(text: "ፕሮግራሞች"),
                  Tab(text: "ስለ እኛ"),
                ],
              ),
              title: Center(child: const Text('አዋሽ90.7  ኤፍኤም')),
            ),
            body: TabBarView(
              children: [
                // radiolive(),
                // HomeScreen(),
                AudioPlayerUrl(), MyWebView(), Aboutus()
              ],
            ),
            bottomNavigationBar: FancyBottomNavigation(
              barBackgroundColor: Colors.lightBlue,
              circleColor: Colors.amber,
              activeIconColor: Colors.white,
              textColor: Colors.white,
              inactiveIconColor: Colors.white,
              tabs: [
                TabData(
                    iconData: Icons.play_arrow,
                    title: "Play",
                    onclick: () {
                      playMusic();
                    }),
                TabData(
                    iconData: Icons.pause,
                    title: "Pause",
                    onclick: () {
                      pauseMusic();
                    }),
                TabData(
                    iconData: Icons.stop_circle,
                    title: "Stop",
                    onclick: () {
                      stopMusic();
                    })
              ],
              onTabChangedListener: (position) {
                setState(() {
                  currentPage = position;
                });
              },
            )),
      ),
    );
  }
}
