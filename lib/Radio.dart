import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';

// import 'package:unicorndial/unicorndial.dart';

class AudioPlayerUrl extends StatefulWidget {
  @override
  _AudioPlayerUrlState createState() => _AudioPlayerUrlState();
}

class _AudioPlayerUrlState extends State<AudioPlayerUrl> {
  AudioPlayer audioPlayer = AudioPlayer();

  String url = 'https://stream.zeno.fm/qh9v7bmw3tzuv.aac';

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  /// Optional
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          value: timeProgress.toDouble(),
          max: audioDuration.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

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

  /// Optional
  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "አዋሽ90.7  ኤፍኤም ",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
                ),
                SizedBox(height: 0),
                Column(
                  children: [
                    Image.asset(
                      'asset/logo.png',
                      width: 200.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  // height: 200,
                  child: Center(
                      child: Text(
                    "ከሀገር . በሀገር . ለሀገር ! ",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
                ),

                // ProfileSevenPage(),
                SizedBox(
                  height: 1.0,
                ),
                Container(
                  width: double.infinity,
                  // height: 200,
                  child: Center(
                      child: Text(
                    "የቀጥታ ስርጭት ",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
                ),
                Spacer(),
                // Container(
                //   color: Colors.lightBlue,
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Card(
                //         elevation: 2,
                //         shadowColor: Colors.black,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15.0)),
                //         color: Colors.white,
                //         child: IconButton(
                //             iconSize: 40,
                //             onPressed: () {
                //               playMusic();
                //             },
                //             icon: Icon(Icons.play_arrow_rounded,
                //                 color: Colors.red)),
                //       ),
                //       Card(
                //         elevation: 2,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15.0)),
                //         color: Colors.white,
                //         child: IconButton(
                //             iconSize: 40,
                //             onPressed: () {
                //               pauseMusic();
                //             },
                //             icon: Icon(Icons.pause_rounded, color: Colors.red)),
                //       ),
                //       Card(
                //         elevation: 2,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15.0)),
                //         color: Colors.white,
                //         child: IconButton(
                //             iconSize: 40,
                //             onPressed: () {
                //               stopMusic();
                //             },
                //             icon: Icon(
                //               Icons.stop_circle_rounded,
                //               color: Colors.red,
                //             )),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
      //     ),
    );
  }
}
