import 'package:flutter/material.dart';
import 'package:todoapp/views/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}