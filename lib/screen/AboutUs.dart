import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Aboutus> {
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
                SizedBox(height: 16.0),
                Column(
                  children: [
                    Image.asset(
                      'asset/logo.png',
                      width: 200.0,
                      height: 140.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  // height: 200,
                  child: Center(
                      child: Text(
                    "የጽሁፍ መልእክት ፡ 6804 ",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
                ),

                // ProfileSevenPage(),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: double.infinity,
                  // height: 200,
                  child: Center(
                      child: Text(
                    "ስልክ ቁጥር፡ 6804 ",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
                ),
                Container(
                  width: double.infinity,
                  // height: 200,
                  child: Center(
                      child: Text(
                    "011 554 3319",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
      //     ),
    );
    // );
  }
}
