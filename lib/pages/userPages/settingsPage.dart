import 'package:flutter/material.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:security_app/storage/jwtstorage.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.width) * 0.656,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/Security.png'),
                    fit: BoxFit.fitWidth)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Container(
              child: MaterialButton(
                color: azulOscuro,
                minWidth: 180.0,
                height: 60.0,
                onPressed: () async {
                  if (await JsonStorage.removeToken()) {
                    Navigator.pushReplacementNamed(context, "/startPage");
                  } else {
                    print("Error inesperado");
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.0)),
                child: Text('Cerrar sesion',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
