import 'package:flutter/material.dart';
import 'package:security_app/storage/jwtstorage.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
          minWidth: 150.0,
          height: 60.0,
          onPressed: () async {
            if (await JsonStorage.removeToken()) {
              Navigator.pushReplacementNamed(context, "/startPage");
            } else {
              print("Error inesperado");
            }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(33.0)),
          child: Text('Cerrar sesion improvisado',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
