import 'package:flutter/material.dart';

class ImageReader extends StatelessWidget {
  final String fichiers;

  const ImageReader({Key key, @required this.fichiers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("$fichiers"), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
