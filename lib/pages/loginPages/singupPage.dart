import 'package:flutter/material.dart';

class SingupPage extends StatefulWidget {
  SingupPage({Key key}) : super(key: key);

  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Text('Registrate'),),
    );
  }
}