import 'package:flutter/material.dart';
import 'package:tec/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TECH BLOG',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', ''),
      ],
      theme: ThemeData(
        fontFamily: 'MyFontRegular',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'MyFontMedium',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}
