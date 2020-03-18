import 'package:flutter/material.dart';
import 'package:rutorrent/screens/home.dart';



void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      title: 'CCE Rutorrent',
      home: Home(),
    );
  }
}