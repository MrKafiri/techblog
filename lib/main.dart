import 'package:flutter/material.dart';
import 'package:tec/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TECH BLOG',
      theme: ThemeData(
        fontFamily: 'MyFontRegular',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'MyFontMedium',
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          headline2: TextStyle(
            fontFamily: 'MyFontBold',
            color: Color(0xFF285fa4),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}
