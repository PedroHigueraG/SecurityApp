import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:security_app/controller/imagesController.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:http/http.dart' as http;
import 'package:security_app/storage/jwtstorage.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: negroAzul,
        appBar: AppBar(
          title: Text("Galería de fotos"),
          backgroundColor: azulOscuro,
        ),
        body: Gallery(),
      ),
    );
  }
}

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool loading;
  List<dynamic> images_url;

  @override
  void initState() {
    loading = true;
    images_url = [];

    _loadImages();

    super.initState();
  }

  void _loadImages() async {
    final _urls =
        await ImagesController.getImages(await JsonStorage.getToken());
    setState(() {
      loading = false;
      images_url = _urls;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return imagePage(images_url[index]);
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(images_url[index]),
            ),
          );
        },
        itemCount: images_url.length);
  }
}

class imagePage extends StatelessWidget {
  final String url;
  imagePage(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(child: Image.network(url)),
    );
  }
}
