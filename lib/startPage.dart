import 'package:flutter/material.dart';


Color azulClaro = new Color(0xff5ac7ff);
Color azulOscuro = new Color(0xff0c3249);
Color negroAzul = new Color(0xff07112c);

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: negroAzul,
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/chip.png"),
                        fit: BoxFit.cover)),
              ),
              Container(
                child: Image(image: AssetImage('assets/img/Trazado.png')),
                alignment: Alignment.bottomCenter,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'BIENVENIDOS',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: azulClaro),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/img/icon.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      '¡La mejor manera de monitorear tu hogar!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: azulClaro,
                      ),
                    ),
                  ),
                  MaterialButton(
                    minWidth: 150.0,
                    height: 60.0,
                    onPressed: () {},
                    color: azulClaro,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33.0)),
                    child: Text('Iniciar',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: azulOscuro)),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
