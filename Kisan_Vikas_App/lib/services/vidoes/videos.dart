import 'package:flutter/material.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.lightGreen[600],
      title: const Text('VIDEOS' ,
      style:  TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      ),
      ),
    );
  }
}