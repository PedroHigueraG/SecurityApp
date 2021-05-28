import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:security_app/controller/userHTTP.dart';
import 'package:security_app/models/Usuario.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:security_app/storage/jwtstorage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  var mensaje = '';
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'INICIAR SESIÓN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: azulOscuro),
                    ),
                  ),
                  Text(
                    mensaje,
                    style: TextStyle(color: Colors.red),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          controller: userController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.people,
                              color: azulOscuro,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: azulOscuro)),
                            hintText: 'Usuario',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: azulOscuro,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: azulOscuro)),
                            hintText: 'Contraseña',
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          '¿Olvidaste la contraseña?',
                          style: TextStyle(color: azulClaro),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/pages/passPage');
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        MaterialButton(
                          minWidth: 150.0,
                          height: 60.0,
                          onPressed: () async {
                            final user = Usuario(
                                usuario: userController.text,
                                password: passController.text);
                            final res = await CreateUser.authUsuario(user);
                            final data = json.decode(res.body);
                            if (data['token'] != null) {
                              JsonStorage.saveToken(data['token']);
                              Navigator.pushNamed(context, '/pages/userPage');
                            } else {
                              if (data['errors'] != null) {
                                var msj = '';
                                for (Map err in data['errors']) {
                                  msj += err['msg'];
                                  print(err['msg']);
                                }
                                setState(() {
                                  mensaje = msj;
                                });
                              } else {
                                setState(() {
                                  mensaje = data['msg'];
                                });
                                print(data['msg']);
                              }
                            }
                          },
                          color: azulClaro,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(33.0)),
                          child: Text('Iniciar sesión',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: azulOscuro)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("¿Nuevo usuario? "),
                              GestureDetector(
                                child: Text(
                                  'Regístrate',
                                  style: TextStyle(color: azulClaro),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/pages/singupPage');
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
