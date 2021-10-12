import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:security_app/storage/jwtstorage.dart';

import '../main.dart';

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
    Timer(Duration(milliseconds: 500), () => _controller.forward());

/*        FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        //jiji
      }
    });
*/
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      //jiji
    });
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
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/chip.png'),
                      fit: BoxFit.cover)),
            ),
            FadeTransition(
              opacity: _animation,
              child: Container(
                child: Image(
                  image: AssetImage('assets/img/Trazado.png'),
                  width: MediaQuery.of(context).copyWith().size.width,
                  fit: BoxFit.cover,
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(0, -0.3), end: Offset.zero)
                          .animate(_animation),
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
                  position:
                      Tween<Offset>(begin: Offset(0, -0.2), end: Offset.zero)
                          .animate(_animation),
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
                  position:
                      Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
                          .animate(_animation),
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
                  position:
                      Tween<Offset>(begin: Offset(0, 0.8), end: Offset.zero)
                          .animate(_animation),
                  child: FadeTransition(
                    opacity: _animation,
                    child: MaterialButton(
                      minWidth: 150.0,
                      height: 60.0,
                      onPressed: () async {
                        String token =
                            await FirebaseMessaging.instance.getToken();
                        print(token);
                        if (await JsonStorage.authToken()) {
                          Navigator.pushNamed(context, '/pages/userPage');
                        } else {
                          Navigator.pushReplacementNamed(
                              context, '/pages/loginPage');
                        }
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
        ));
  }
}
