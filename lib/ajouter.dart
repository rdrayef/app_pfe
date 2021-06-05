import 'dart:io';
import 'dart:ui';

import 'package:accidenyally/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  File _image;

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

  RangeValues _currentRangeValues = const RangeValues(0, 790000);
  String _selectedCurrency;
  String _selectedcarb;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  String docid;

  @override
  Widget build(BuildContext context) {
    Future getImage(BuildContext context) async {
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
      Navigator.of(context).pop();
    }

    /* Future uploadPic(BuildContext context) async {
      
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    } */
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo[900],
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.save,
                  color: Colors.indigo[900],
                ),
                onPressed:
                    () {} /* async {
              /*   uploadPic(context); */
     final uid = (await FirebaseAuth.instance.currentUser()).uid;
     var storigeimg = FirebaseStorage.instance.ref().child(_image.path);
    var timg = storigeimg.putFile(_image);
    var imgurl = await (await timg.onComplete).ref.getDownloadURL();
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
        'img_profile': imgurl

       });
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Addvh()));
               } */
                ),
          ],
        ),
        body: Form(
          key: _formKeyValue,
          autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              Text(
                "Ajouter une véhicule",
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              child: new SizedBox(
                                width: 320.0,
                                height: 180.0,
                                child: (_image != null)
                                    ? Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          size: 25,
                                          color: rougggecolor,
                                        ),
                                        onPressed: () {
                                          getImage(context);
                                        },
                                      ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              new TextFormField(
                controller: _immatriController,
                decoration: InputDecoration(
                  labelText: "N_immatriculation",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              SizedBox(height: 10.0),
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
                    } else {
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
                            width: screenSize.width * 0.914,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: "MARQUE",
                                labelStyle: TextStyle(
                                    color: Colors.indigo[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
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
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
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
                    } else {
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
                            width: screenSize.width * 0.914,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: "MODELE",
                                labelStyle: TextStyle(
                                    color: Colors.indigo[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
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
              SizedBox(height: 10.0),
              new TextFormField(
                controller: _typeController,
                decoration: InputDecoration(
                  labelText: "TYPE",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              SizedBox(height: 10.0),
              StreamBuilder<QuerySnapshot>(
                  stream:
                      Firestore.instance.collection("Carburants").snapshots(),
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
                    } else {
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
                            width: screenSize.width * 0.914,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: "CARBURANT",
                                labelStyle: TextStyle(
                                    color: Colors.indigo[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
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
              TextField(
                controller: _dateatrController,
                decoration: InputDecoration(
                  labelText: "DATE MISE EN CIRCULATION",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
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
              SizedBox(height: 20.0),
              Text("KILOMETRAGE",
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RangeSlider(
                  activeColor: Colors.red,
                  values: _currentRangeValues,
                  min: 0,
                  max: 790000,
                  divisions: 15,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    String v = "start:${values.start},END:${values.end}";
                    print(v);
                    setState(() {
                      _currentRangeValues = values;
                      print(v);
                    });
                  },
                ),
              ),
              new TextFormField(
                controller: _genreController,
                decoration: InputDecoration(
                  labelText: "GENRE",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              new TextFormField(
                controller: _puissanceController,
                decoration: InputDecoration(
                  labelText: "PUISSANCE FISCALE",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              SizedBox(height: 10.0),
              new TextFormField(
                controller: _npController,
                decoration: InputDecoration(
                  labelText: "NOMBRE DE PLACE",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              SizedBox(height: 10.0),
              new TextFormField(
                controller: _ncController,
                decoration: InputDecoration(
                  labelText: "NOMBRE DE CYLINDRE",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              SizedBox(height: 10.0),
              new TextFormField(
                controller: _nchassController,
                decoration: InputDecoration(
                  labelText: "NOMBRE DU CHASSIS",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              SizedBox(height: 10.0),
              new TextFormField(
                controller: _ptController,
                decoration: InputDecoration(
                  labelText: "POIDS TOTALE",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              new TextFormField(
                controller: _pvController,
                decoration: InputDecoration(
                  labelText: "POIDS VIDE",
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ],
          ),
        ));
  }
}
