import 'package:amazonui/screens/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'CircularStd',
      ),
      home: Wrapper(),
    );
  }
}
