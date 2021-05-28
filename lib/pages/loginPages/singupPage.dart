import 'dart:async';
import 'dart:convert';
import 'dart:io';
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
  final _form = GlobalKey<FormState>();
  var mensajito = '';

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
                  Form(
                    key: _form,
                    child: Column(
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
                        Text(
                          mensajito,
                          style: TextStyle(color: Colors.red),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'No puede dejar el campo vacío';
                                  } else if (value.length < 5) {
                                    return 'Nombre de usuario corto';
                                  }
                                  return null;
                                },
                                controller: userController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.people,
                                    color: azulOscuro,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: azulOscuro)),
                                  hintText: 'Usuario',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'No puede dejar el campo vacío';
                                  } else if (!isValidEmail(value)) {
                                    return 'Correo electronico no válido';
                                  }
                                  return null;
                                },
                                controller: mailController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: azulOscuro,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: azulOscuro)),
                                  hintText: 'Correo electrónico',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'No puede dejar el campo vacío';
                                  } else if (value.length < 6) {
                                    return 'El número telefónico debe ser mayor a 6 números';
                                  }
                                  return null;
                                },
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
                                      borderSide:
                                          BorderSide(color: azulOscuro)),
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
                                      borderSide:
                                          BorderSide(color: azulOscuro)),
                                  hintText: 'Dirección',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'No puede dejar el campo vacío';
                                  } else if (value.length < 8) {
                                    return 'La contraseña debe ser mayor a 8 caracteres';
                                  }
                                  return null;
                                },
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
                                      borderSide:
                                          BorderSide(color: azulOscuro)),
                                  hintText: 'Contraseña',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'No puede dejar el campo vacío';
                                  } else if (!(value == passController.text)) {
                                    return 'Las contraseñas no coinciden';
                                  }
                                  return null;
                                },
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
                                      borderSide:
                                          BorderSide(color: azulOscuro)),
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
                                  if (_form.currentState.validate()) {
                                    final user = Usuario(
                                        usuario: userController.text,
                                        password: passController.text,
                                        correo: mailController.text,
                                        direccion: addressController.text,
                                        telefono: phoneController.text);

                                    final res =
                                        await CreateUser.crearUsuario(user);

                                    if (res.statusCode == 200) {
                                      print("Creado correctamente");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Usuario registrado correctamente')));

                                      Navigator.pushNamed(
                                          context, '/pages/loginPage');
                                    } else {
                                      final data = json.decode(res.body);
                                      if (data['errors'] != null) {
                                        var mens = '';
                                        for (Map err in data['errors']) {
                                          mens += err['msg'] + ' ';
                                          print(err['msg']);
                                        }
                                        setState(() {
                                          mensajito = mens;
                                        });
                                      } else {
                                        setState(() {
                                          mensajito = data;
                                        });
                                        print(data);
                                      }
                                    }
                                  } else {
                                    print(
                                        'Ha ocurrido un error, revise el formulario');
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
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
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
