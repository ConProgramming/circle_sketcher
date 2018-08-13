import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'theme.dart';
//import 'package:gradient_app_bar/gradient_app_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appName = "Circle Sketcher";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: appTheme,
      home: Home(title: appName),
    );
  }
}