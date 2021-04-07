import 'dart:async';

import 'package:flutter/material.dart';

Color azulClaro = new Color(0xff5ac7ff);
Color azulOscuro = new Color(0xff0c3249);
Color negroAzul = new Color(0xff07112c);

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    Timer(Duration(milliseconds: 500),()=>_controller.forward());
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              FadeTransition(
                opacity: _animation,
                child: Container(
                  child: Image(image: AssetImage('assets/img/Trazado.png')),
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0,-0.3),
                      end: Offset.zero
                       ).animate(_animation),
                    child: FadeTransition(
                      opacity: _animation,
                      child: Text(
                        'BIENVENIDOS',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: azulClaro),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0,-0.2),
                      end: Offset.zero
                       ).animate(_animation),
                    child: FadeTransition(
                      opacity: _animation,
                      child: Center(
                        child: Image.asset(
                          'assets/img/icon.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0,0.3),
                      end: Offset.zero
                       ).animate(_animation),
                    child: FadeTransition(
                      opacity: _animation,
                      child: Container(
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
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0,0.8),
                      end: Offset.zero
                       ).animate(_animation),
                    child: FadeTransition(
                      opacity: _animation,
                      child: MaterialButton(
                        minWidth: 150.0,
                        height: 60.0,
                        onPressed: () {
                          Navigator.pushNamed(context, '/pages/mainPage');
                        },
                        color: azulClaro,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33.0)),
                        child: Text('Iniciar',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: azulOscuro)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
