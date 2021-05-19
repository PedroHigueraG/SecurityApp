import 'package:flutter/material.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:security_app/pages/userPages/galleryPage.dart';
import 'package:security_app/pages/userPages/principalPage.dart';
import 'package:security_app/pages/userPages/settingsPage.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _currentPage = 1;
  List<Widget> _pages = [GalleryPage(),PrincipalPage(),SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          currentIndex: _currentPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.image), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.lock), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          backgroundColor: azulOscuro,
          selectedItemColor: azulClaro,
          unselectedItemColor: Colors.white,
          iconSize: 30,
          
        ),
      ),
    );
  }
}
