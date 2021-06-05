import 'package:accidenyally/colors.dart';
import 'package:accidenyally/inscrp31.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Inscription2 extends StatefulWidget {
  @override
  _Inscription2State createState() => _Inscription2State();
}

class _Inscription2State extends State<Inscription2> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _societecontroller = TextEditingController();
  TextEditingController _attescontroller = TextEditingController();
  TextEditingController _datexcontroller = TextEditingController();
  TextEditingController _agencecontroller = TextEditingController();
  TextEditingController _policcontroller = TextEditingController();
  TextEditingController _dateatrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.indigo[900], Colors.indigo[900]]),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Inscription",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "information assurance ",
                  style: TextStyle(color: Colors.white24, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.indigo[900]))),
                                child: TextField(
                                  controller: _societecontroller,
                                  decoration: InputDecoration(
                                    labelText: "Société Assurance",
                                    hintStyle: TextStyle(color: Colors.black12),
                                    labelStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.indigo[900]))),
                                child: TextField(
                                  controller: _attescontroller,
                                  decoration: InputDecoration(
                                    labelText: "N° Attestation",
                                    hintStyle: TextStyle(color: Colors.black12),
                                    labelStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.indigo[900]))),
                                child: TextField(
                                  controller: _dateatrController,
                                  decoration: InputDecoration(
                                    labelText: "Date d\'attribution",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                      onPressed: () async {
                                        var date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100));
                                        _dateatrController.text =
                                            date.toString().substring(0, 10);
                                      },
                                      icon: Icon(
                                        Icons.calendar_today,
                                        size: 20,
                                        color: bluecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.indigo[900]))),
                                child: TextField(
                                  controller: _datexcontroller,
                                  decoration: InputDecoration(
                                    labelText: "Date d\'expiration ",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                      onPressed: () async {
                                        var date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100));
                                        _datexcontroller.text =
                                            date.toString().substring(0, 10);
                                      },
                                      icon: Icon(
                                        Icons.calendar_today,
                                        size: 20,
                                        color: bluecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.indigo[900]))),
                                child: TextField(
                                  controller: _agencecontroller,
                                  decoration: InputDecoration(
                                    labelText: "Agence",
                                    hintStyle: TextStyle(color: Colors.black12),
                                    labelStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.indigo[900]))),
                                child: TextField(
                                  controller: _policcontroller,
                                  decoration: InputDecoration(
                                    labelText: "N°Police",
                                    hintStyle: TextStyle(color: Colors.black12),
                                    labelStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 85),
                                child: Container(
                                  child: SizedBox(
                                    height: 45,
                                    width: 180,
                                    child: RaisedButton(
                                      color: bluecolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Text(
                                        "Suivant",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                      onPressed: () async {
                                        final uid = (await FirebaseAuth.instance
                                                .currentUser())
                                            .uid;
                                        Firestore.instance
                                            .collection('utilisateurs')
                                            .document(uid)
                                            .collection('assurance')
                                            .document()
                                            .setData({
                                          'societe assurance':
                                              _societecontroller.text,
                                          'num attestation':
                                              _attescontroller.text,
                                          'date attribution ':
                                              _dateatrController.text,
                                          'date expiration':
                                              _datexcontroller.text,
                                          'agence': _agencecontroller.text,
                                          'num police': _policcontroller.text,
                                        });

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Inscription31()));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
