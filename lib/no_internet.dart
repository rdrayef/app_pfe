import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Nointernert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/images/no-internet.png",
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              AutoSizeText(
                "Aucune connexion Internet",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(9),
                child: AutoSizeText(
                  "Vous n'êtes pas connecté à Internet, assurez-vous qu'une connexion à Internet est établie",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
