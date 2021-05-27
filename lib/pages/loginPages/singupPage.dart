import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:security_app/controller/userHTTP.dart';
import 'package:security_app/models/Usuario.dart';
import 'package:security_app/pages/startPage.dart';

class SingupPage extends StatefulWidget {
  SingupPage({Key key}) : super(key: key);

  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  TextEditingController userController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();

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
                      'REGÍSTRO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: azulOscuro),
                    ),
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
                          controller: mailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: azulOscuro,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: azulOscuro)),
                            hintText: 'Correo electrónico',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: azulOscuro,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: azulOscuro)),
                            hintText: 'Teléfono',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.house,
                              color: azulOscuro,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: azulOscuro)),
                            hintText: 'Dirección',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: confirmPassController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: azulOscuro,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: azulOscuro)),
                            hintText: 'Confirmar Contraseña',
                          ),
                        ),
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
                                password: passController.text,
                                correo: mailController.text,
                                direccion: addressController.text,
                                telefono: phoneController.text);
                            final res = await CreateUser.crearUsuario(user);
                            if (res.statusCode == 200) {
                              print("Creado correctamente");
                              Navigator.pushNamed(context, '/pages/loginPage');
                            } else {
                              final data = json.decode(res.body);
                              if (data['errors'] != null) {
                                for (Map err in data['errors']) {
                                  print(err['msg']);
                                }
                              } else {
                                print(data);
                              }
                            }
                          },
                          color: azulClaro,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(33.0)),
                          child: Text('Registrarse',
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
                              Text("¿Ya tienes cuenta? "),
                              GestureDetector(
                                child: Text(
                                  'Iniciar sesión',
                                  style: TextStyle(color: azulClaro),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/pages/loginPage');
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
