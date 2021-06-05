import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdfloader extends StatelessWidget {
  final String fichiers;

  const Pdfloader({Key key, @required this.fichiers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(body: SfPdfViewer.network('$fichiers')),
    );
  }
}
