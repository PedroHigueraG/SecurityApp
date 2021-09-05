import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:security_app/pages/startPage.dart';
import 'package:http/http.dart' as http;

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
  List<String> ids;

  @override
  void initState() {
    loading = true;
    ids = [];

    _loadImages();

    super.initState();
  }

  void _loadImages() async {
    final response =
        await http.get(Uri.parse(('https://picsum.photos/v2/list')));
    final json = jsonDecode(response.body);
    List<String> _ids = [];
    for (var image in json) {
      _ids.add(image['id']);
    }
    setState(() {
      loading = false;
      ids = _ids;
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
                return imagePage(ids[index]);
              }));
            },
            child:
                Image.network("https://picsum.photos/id/${ids[index]}/300/300"),
          );
        },
        itemCount: ids.length);
  }
}

class imagePage extends StatelessWidget {
  final String id;
  imagePage(this.id);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(child: Image.network('https://picsum.photos/id/$id/600/600')),
    );
  }
}
