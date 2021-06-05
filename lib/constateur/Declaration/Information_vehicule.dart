import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/assurance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../globals_vars.dart' as globals;

class Infosvehicule extends StatefulWidget {
  String docid;
  String constid;
  Infosvehicule({Key key, @required this.docid, @required this.constid})
      : super(key: key);

  @override
  _InfosvehiculeState createState() =>
      _InfosvehiculeState(docid: docid, constid: constid);
}

class _InfosvehiculeState extends State<Infosvehicule> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _marquecontroller = TextEditingController();
  TextEditingController _modelecontroller = TextEditingController();
  TextEditingController _typecontroller = TextEditingController();
  TextEditingController _dep = TextEditingController();
  TextEditingController _dest = TextEditingController();
  String docid;
  String constid;
  _InfosvehiculeState({this.docid, this.constid});
  var marque, modele, type;
  String _selectedcarb;

  Widget cmb(BuildContext context, String id) {
    Size screenSize = MediaQuery.of(context).size;

    Future<void> _getvehinfo(String s) async {
      Firestore.instance
          .collection('utilisateurs')
          .document(docid)
          .collection('vehicule')
          .document(s)
          .get()
          .then((value) {
        marque = value.data['marque'];
        modele = value.data['modele'];
        type = value.data['type'];
        _marquecontroller.text = marque;
        _modelecontroller.text = modele;
        _typecontroller.text = type;

        /*email = value.data['Login'];
      // motpass = value.data['Password'];
      dtnss = value.data['Date_naissance'];
      adresse = value.data['Adresse'];
      imgp = value.data['img_profile']; */
        print("------------------->" + marque + "<_______________________>");
      });
    }

    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("utilisateurs")
            .document(id)
            .collection("vehicule")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotate,
                  color: Colors.orange,
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
                    "   " + snap['Immatriculation'],
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
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white70,
                  ),
                  child: DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    hint: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            "   " + "Sélectionnez une marque",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.28,
                        )
                      ],
                    ),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: bluecolor,
                    ),
                    items: carbItems,
                    onChanged: (currencyValue) {
                      setState(() {
                        _selectedcarb = currencyValue;
                        _getvehinfo(_selectedcarb);
                        print(currencyValue);
                        _marquecontroller.text = marque;
                        _modelecontroller.text = modele;
                        _typecontroller.text = type;
                      });
                    },
                    value: _selectedcarb,
                    isExpanded: false,
                  ),
                ),
              ],
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    double devwidth(BuildContext context) => MediaQuery.of(context).size.width;
    double devheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("Informations véhicule",
                style: TextStyle(
                    color: bluecolor,
                    fontSize: 23,
                    fontWeight: FontWeight.w600)),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.car_repair,
                size: 30,
                color: rougggecolor,
              ),
              onPressed: () {},
            )),
        backgroundColor: bluecolors2,
        body: Container(
          margin: EdgeInsets.only(top: devheight(context) * 0.025),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: devheight(context) * 0.04,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ///////////////////combo
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 10.0,
                              color: blufanccolor.withOpacity(0.5),
                            ),
                          ],
                        ),
                        width: devwidth(context) * 0.9,
                        child: cmb(context, docid)),
                    //////////////////combo
                    SizedBox(
                      height: devheight(context) * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                            color: blufanccolor.withOpacity(0.5),
                          ),
                        ],
                      ),
                      width: devwidth(context) * 0.9,
                      child: new Form(
                        key: _formKey,
                        child: TextFormField(
                          autocorrect: true,
                          readOnly: true,
                          controller: _marquecontroller,
                          decoration: InputDecoration(
                            hintText: 'Marque',
                            labelText: 'Marque',
                            suffixIcon: Icon(
                              Icons.branding_watermark,
                              color: bluecolor,
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: blufanccolor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: devheight(context) * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                            color: blufanccolor.withOpacity(0.5),
                          ),
                        ],
                      ),
                      width: devwidth(context) * 0.9,
                      child: TextFormField(
                        autocorrect: true,
                        readOnly: true,
                        controller: _modelecontroller,
                        decoration: InputDecoration(
                          hintText: 'Modèle',
                          labelText: 'Modèle',
                          suffixIcon: Icon(
                            Icons.view_module,
                            color: bluecolor,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: blufanccolor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: devheight(context) * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                            color: blufanccolor.withOpacity(0.5),
                          ),
                        ],
                      ),
                      width: devwidth(context) * 0.9,
                      child: TextFormField(
                        autocorrect: true,
                        readOnly: true,
                        controller: _typecontroller,
                        decoration: InputDecoration(
                          hintText: 'Type',
                          labelText: 'Type',
                          suffixIcon: Icon(
                            Icons.merge_type_rounded,
                            color: bluecolor,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: blufanccolor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: devheight(context) * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                            color: blufanccolor.withOpacity(0.5),
                          ),
                        ],
                      ),
                      width: devwidth(context) * 0.9,
                      child: TextFormField(
                        autocorrect: true,
                        controller: _dep,
                        decoration: InputDecoration(
                          hintText: 'Départ',
                          labelText: 'Départ',
                          suffixIcon: Icon(
                            Icons.south_east_rounded,
                            color: bluecolor,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: blufanccolor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: devheight(context) * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                            color: blufanccolor.withOpacity(0.5),
                          ),
                        ],
                      ),
                      width: devwidth(context) * 0.9,
                      child: TextFormField(
                        autocorrect: true,
                        controller: _dest,
                        decoration: InputDecoration(
                          hintText: 'Déstination',
                          labelText: 'Déstination',
                          suffixIcon: Icon(
                            Icons.north_east_rounded,
                            color: bluecolor,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: blufanccolor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: devheight(context) * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                            color: blufanccolor.withOpacity(0.5),
                          ),
                        ],
                      ),
                      width: devwidth(context) * 0.9,
                    ),
                    SizedBox(
                      height: devheight(context) * 0.05,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: devwidth(context) / 1.6,
                          right: devwidth(context) * 0.045),
                      child: SizedBox(
                          height: 50,
                          width: 120,
                          child: RaisedButton(
                            color: bluecolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            onPressed: () {
                              print("------666666------->" + constid);
                              print(globals.globalInt);
                              Firestore.instance
                                  .collection('constas')
                                  .document(constid)
                                  .setData({
                                'Immatriculation': _selectedcarb,
                                'Départ': _dep.text,
                                'Déstination': _dest.text
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Infosassurance(docid: docid),
                                  ));
                            },
                            child: Icon(
                              Icons.trending_flat_rounded,
                              color: Colors.white,
                              size: 45,
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
