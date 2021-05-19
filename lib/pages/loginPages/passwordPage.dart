import 'dart:async';
import 'package:flutter/material.dart';
import 'package:security_app/pages/startPage.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({Key key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = new TextEditingController();
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
        body: SingleChildScrollView(
          child: Column(
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
                      position: Tween<Offset>(
                              begin: Offset(0, -0.2), end: Offset.zero)
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Restablecer contraseña',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: azulOscuro),
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Ingrese su correo electrónico para enviarle los pasos',
                        style: TextStyle(color: azulOscuro),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: azulOscuro,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: azulOscuro)),
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: MaterialButton(
                        minWidth: 150.0,
                        height: 60.0,
                        onPressed: () {},
                        color: azulClaro,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33.0)),
                        child: Text('Restablecer',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: azulOscuro)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("¿La recuperaste? "),
                          GestureDetector(
                            child: Text(
                              'Iniciar sesión',
                              style: TextStyle(color: azulClaro),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/pages/loginPage');
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
