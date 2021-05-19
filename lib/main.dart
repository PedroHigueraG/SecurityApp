import 'package:flutter/material.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:security_app/pages/loginPage.dart';
import 'package:security_app/pages/userPage.dart';

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
        '/pages/loginPage': (BuildContext context) => LoginPage(),
        '/pages/userPage': (BuildContext context) => UserPage()
      },
      home: StartPage(),
    );
  }
}
