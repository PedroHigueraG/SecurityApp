import 'dart:async';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    Timer(Duration(milliseconds: 500), () => _controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.width) * 0.656,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/Security.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                Positioned(
                  top: 65,
                  child: SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0, -0.2), end: Offset.zero)
                            .animate(_animation),
                    child: FadeTransition(
                      opacity: _animation,
                      child: Center(
                        child: Image.asset(
                          'assets/img/icon.png',
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),)
           
          ],
        ));
  }
}
