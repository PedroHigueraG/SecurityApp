import 'package:flutter/material.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:security_app/pages/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Security App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/pages/mainPage': (BuildContext context) => MainPage(),
      },
      home: StartPage(),
    );
  }
}
