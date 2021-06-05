import 'package:accidenyally/colors.dart';
import 'package:accidenyally/inscrp1.dart';
import 'package:accidenyally/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class Inscription31 extends StatefulWidget {
  @override
  _Inscription31State createState() => _Inscription31State();
}

class _Inscription31State extends State<Inscription31> {
  

  final _formkey = GlobalKey<FormState>();
   TextEditingController _dateatrController = TextEditingController();
  TextEditingController _immatriController = TextEditingController();
  TextEditingController _marqueController = TextEditingController();
  TextEditingController _modeleController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _carburController = TextEditingController();
  TextEditingController _kilometController = TextEditingController();
  TextEditingController _genreController = TextEditingController();
  TextEditingController _puissanceController = TextEditingController();
  TextEditingController _npController = TextEditingController();
  TextEditingController _ncController = TextEditingController();
  TextEditingController _nchassController = TextEditingController();
  TextEditingController _ptController = TextEditingController();
  TextEditingController _pvController = TextEditingController();
  



  String _selectedCurrency;
  String _selectedcarb;
  


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                    "information Vehicule ",
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
                                    controller: _immatriController,
                                    decoration: InputDecoration(
                                      labelText: "Immatriculation",
                                      hintStyle:
                                          TextStyle(color: Colors.black12),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                 StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("marque").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballRotate,
                                  color: Colors.transparent,
                                ),
                              ),
                            );
                          }
                    else {
                      List<DropdownMenuItem> currencyItems = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        currencyItems.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.documentID,
                              style: TextStyle(color: bluecolor),
                            ),
                            value: "${snap.documentID}",
                          ),
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: screenSize.width * 0.840,
                             decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                            child: DropdownButtonFormField(
                              
                              decoration: InputDecoration(
                                labelText: "marque",
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 200),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: bluecolor,
                                ),
                              ),
                              items: currencyItems,
                              onChanged: (currencyValue) {
                                setState(() {
                                  _selectedCurrency = currencyValue;
                                  
                                });
                              },
                              value: _selectedCurrency,
                              isExpanded: false,
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                   StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("marque").snapshots(),
                  builder: (context, snapshot) {
                   if (!snapshot.hasData) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballRotate,
                                  color: Colors.transparent,
                                ),
                              ),
                            );
                          }
                    else {
                      List<DropdownMenuItem> currencyItems = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        currencyItems.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.documentID,
                              style: TextStyle(color: bluecolor),
                            ),
                            value: "${snap.documentID}",
                          ),
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                      width: screenSize.width * 0.840,
decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: "modele",
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: bluecolor,
                                ),
                              ),
                              items: currencyItems,
                              onChanged: (currencyValue) {
                                setState(() {
                                  _selectedCurrency = currencyValue;
                                });
                              },
                              value: _selectedCurrency,
                              isExpanded: false,
                            ),
                          ),
                        ],
                      );
                    }
                  }),

                                  Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextFormField(
                controller: _typeController,
                decoration: InputDecoration(
                  labelText: "type",
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
                                ),
                                 StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("Carburants").snapshots(),
                  builder: (context, snapshot) {
                   if (!snapshot.hasData) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballRotate,
                                  color: Colors.transparent,
                                ),
                              ),
                            );
                          }
                    else {
                      List<DropdownMenuItem> carbItems = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        carbItems.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.documentID,
                              style: TextStyle(color: bluecolor),
                            ),
                            value: "${snap.documentID}",
                          ),
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                            width: screenSize.width * 0.840,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: "Carburants",
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: bluecolor,
                                ),
                              ),
                              items: carbItems,
                              onChanged: (currencyValue) {
                                
                                setState(() {
                                  _selectedcarb = currencyValue;
                                  print(currencyValue);
                                });
                              },
                              value: _selectedcarb,
                              isExpanded: false,
                            ),
                          ),
                        ],
                      );
                    }
                  }),


                                 Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextField(
                controller: _dateatrController,
                decoration: InputDecoration(
                  labelText: "DATE MISE EN CIRCULATION",
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
                                  child:  TextFormField(
                  controller: _genreController,
                decoration: InputDecoration(
                  labelText: "GENRE",
                   labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
                                ),
              
                                 Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child:  TextFormField(
                 controller: _puissanceController,
                decoration: InputDecoration(
                  labelText: "PUISSANCE FISCALE",
                   labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
                                ),                  
                                
                                
                                 Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child:  TextFormField(
                   controller: _npController,
                decoration: InputDecoration(
                  labelText: "NOMBRE DE PLACE",
                   labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
                                ),

                                
                                 Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child:  TextFormField(
                  controller: _ncController,
                decoration: InputDecoration(
                  labelText: "NOMBRE DE CYLINDRE",
                   labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
                                ),
                                
                                 Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child:  TextFormField(
                  controller: _nchassController,
                decoration: InputDecoration(
                  labelText: "NOMBRE DU CHASSIS",
                   labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
                                ),
                                
                                 Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child:  TextFormField(
                 controller: _ptController,
                decoration: InputDecoration(
                  labelText: "POIDS TOTALE",
                   labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
                                ),
                                
                                 Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child:  TextFormField(
               controller: _pvController,
                decoration: InputDecoration(
                  labelText: "POIDS VIDE",
                   labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
                                ),
                                
                     
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 25),
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
                                          "Terminer",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24),
                                        ),
                                        onPressed: () async {
                                         final uid = (await FirebaseAuth.instance.currentUser()).uid;
      Firestore.instance
      .collection('utilisateurs')
      .document(uid)
      .collection('vehicule')
      .document()
      .setData({
        'Immatriculation':_immatriController.text ,
        'marque':_selectedCurrency ,
        'modele':_selectedCurrency ,
        'type':_typeController.text ,
        'carburant':_selectedcarb ,
        'date mise en circulation':_dateatrController.text ,
        'genre':_genreController.text ,
        'puissance fiscale':_puissanceController.text ,
        'nombre de place':_npController.text ,
        'nombre de cylindre':_ncController.text ,
        'nombre du chassis':_nchassController.text ,
        'poids total':_ptController.text ,
        'poids vide':_pvController.text ,
        'img':"https://firebasestorage.googleapis.com/v0/b/accidentally-d3dca.appspot.com/o/168498-200.png?alt=media&token=6705d418-75b2-4dfc-8b5e-f4580bba0758"
       });
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>Lgn()));  
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
