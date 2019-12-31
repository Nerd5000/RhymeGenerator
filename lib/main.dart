import 'package:flutter/material.dart';
import 'package:rhyme_generator/search.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto',),
      home: Search(),
    );
  }
}