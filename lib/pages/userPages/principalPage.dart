import 'package:flutter/material.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:url_launcher/url_launcher.dart';

Color botonPrincipal = new Color(0xff9e9e9e);
bool statusBoton = false;
Icon iconoBoton = new Icon(
  Icons.lock_open,
  size: 80,
);

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: negroAzul,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/chip.png'),
                      fit: BoxFit.cover)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: Text(
                      'BIENVENIDOS',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                MaterialButton(
                  color: botonPrincipal,
                  shape: CircleBorder(),
                  onPressed: () {
                    setState(() {
                      if (statusBoton) {
                        botonPrincipal = new Color(0xff9e9e9e);
                        iconoBoton = new Icon(Icons.lock_open, size: 80);
                        statusBoton = false;
                      } else {
                        botonPrincipal = azulClaro;
                        iconoBoton = new Icon(Icons.lock_outline, size: 80);
                        statusBoton = true;
                      }
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(50), child: iconoBoton),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      'Oprima el bot??n para encender o apagar el sistema de seguridad',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                MaterialButton(
                  color: azulClaro,
                  onPressed: () async {
                    launch('tel://123');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
