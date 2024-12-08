import 'package:flutter/material.dart';
import 'pages/music_creator_home.dart'; // Import the Music Creator Home page

void main() {
  runApp(MyTuneApp());
}

class MyTuneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyTune",
      home: MusicCreatorHome(), // Set MusicCreatorHome as the starting page
    );
  }
}
