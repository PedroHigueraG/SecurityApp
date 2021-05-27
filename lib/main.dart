import 'package:flutter/material.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:security_app/pages/loginPages/loginPage.dart';
import 'package:security_app/pages/loginPages/singupPage.dart';
import 'package:security_app/pages/loginPages/passwordPage.dart';
import 'package:security_app/pages/userPages/userPage.dart';

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
        '/pages/userPage': (BuildContext context) => UserPage(),
        '/pages/singupPage': (BuildContext context) => SingupPage(),
        '/pages/passPage': (BuildContext context) => PasswordPage(),
        '/startPage': (BuildContext context) => StartPage(),
      },
      home: StartPage(),
    );
  }
}
