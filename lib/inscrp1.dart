import 'package:accidenyally/colors.dart';
import 'package:accidenyally/inscrp2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class Inscription1 extends StatefulWidget {
  @override
  _Inscription1State createState() => _Inscription1State();
}

class _Inscription1State extends State<Inscription1> {
 

  final _formkey = GlobalKey<FormState>();
 
  TextEditingController _assurancecontroller = TextEditingController();
  TextEditingController _permiscontroller = TextEditingController();
  TextEditingController _prefecturecontroller = TextEditingController();
  TextEditingController _catcontroller = TextEditingController();
  TextEditingController _dateatrController = TextEditingController();
  TextEditingController _dateatr1Controller = TextEditingController();
  TextEditingController _dateatr2Controller = TextEditingController();


  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
           Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.indigo[900], Colors.indigo[900]]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                    "information Permis",
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
                                    controller: _permiscontroller,
                                    decoration: InputDecoration(
                                      labelText: "N° permis",
                                      hintStyle:
                                          TextStyle(color: Colors.black12),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                 Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child:  TextField(
                controller: _dateatrController,
                decoration: InputDecoration(
                  labelText: "Délivre le",
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
                controller: _dateatr1Controller,
                decoration: InputDecoration(
                  labelText: "Valable jusqu\'au ",
                  labelStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                            onPressed: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              _dateatr1Controller.text =
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
                                    controller: _prefecturecontroller,
                                    decoration: InputDecoration(
                                      labelText: "Préfecture",
                                      hintStyle:
                                          TextStyle(color: Colors.black12),
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
                                    controller: _catcontroller,
                                    decoration: InputDecoration(
                                      labelText: "Catégorie",
                                      hintStyle:
                                          TextStyle(color: Colors.black12),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                
                               
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 45),
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
                                              color: Colors.white,
                                              fontSize: 24),
                                        ),
                                        onPressed: () async {
                                                     
     final uid = (await FirebaseAuth.instance.currentUser()).uid;
      Firestore.instance
      .collection('utilisateurs')
      .document(uid)
      .collection('permis')
      .document()
      .setData({
        'num permis':_permiscontroller.text ,
        'date delivrer':_dateatrController.text ,
        'valable ':_dateatr1Controller.text ,
        'préfecture':_prefecturecontroller.text ,
        'catégories':_catcontroller.text ,
         });
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>Inscription2())); 
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
          ]
        ),
           ),
            );
      
  }
}
