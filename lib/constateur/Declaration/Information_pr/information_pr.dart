import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/Information_vehicule.dart';
import 'package:accidenyally/constateur/menu.dart';
import 'package:accidenyally/globals_vars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Infos extends StatefulWidget {
  String docid;
  String v;

  Infos({Key key, @required this.docid}) : super(key: key);

  @override
  _InfosState createState() => _InfosState(docid: docid);
}

class _InfosState extends State<Infos> {
  String docid;
  _InfosState({this.docid});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nom = TextEditingController();
    TextEditingController _prenom = TextEditingController();
    TextEditingController _cin = TextEditingController();
    TextEditingController _img = TextEditingController();
    TextEditingController _adresse = TextEditingController();
    double devwidth(BuildContext context) => MediaQuery.of(context).size.width;
    double devheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: StreamGetuserdoc(context),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Scaffold(
                backgroundColor: Colors.white,
              ),
            );
          }
          return Scaffold(
              appBar: new AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text("Information personelle",
                      style: TextStyle(
                          color: bluecolor,
                          fontSize: 23,
                          fontWeight: FontWeight.w600)),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.cancel_rounded,
                      size: 30,
                      color: rougggecolor,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Constateur(),
                          ));
                    },
                  )),
              backgroundColor: bluecolors2,
              body: Container(
                margin: EdgeInsets.only(top: devheight(context) * 0.025),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Align(
                      child: SizedBox(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(snapshot.data['img_profile']),
                          radius: 50,
                          child: ClipOval(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: devheight(context) * 0.05,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
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
                              child: TextField(
                                controller: _nom,
                                autocorrect: true,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: snapshot.data['Nom'],

                                  //labelText: snapshot.data['Nom'],
                                  suffixIcon: Icon(
                                    Icons.person,
                                    color: bluecolor,
                                  ),
                                  hintStyle: TextStyle(color: Colors.black),
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
                              )),
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
                            child: TextField(
                              controller: _prenom,
                              autocorrect: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: snapshot.data['Prenom'],
                                // labelText: 'Prénom',
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: bluecolor,
                                ),
                                hintStyle: TextStyle(color: Colors.black),
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
                            child: TextField(
                              controller: _cin,
                              autocorrect: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: snapshot.data['CIN'],
                                // labelText: 'CIN',
                                suffixIcon: Icon(
                                  Icons.badge,
                                  color: bluecolor,
                                ),
                                hintStyle: TextStyle(color: Colors.black),
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
                            child: TextField(
                              controller: _adresse,
                              autocorrect: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: snapshot.data['Adresse'],
                                // labelText: 'Adresse',
                                suffixIcon: Icon(
                                  Icons.house,
                                  color: bluecolor,
                                ),
                                hintStyle: TextStyle(color: Colors.black),
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
                          SizedBox(
                            height: devheight(context) * 0.1,
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
                                  onPressed: () async {
                                    String constid;
                                    final FirebaseUser user = await FirebaseAuth
                                        .instance
                                        .currentUser();
                                    final userid = user.uid;

                                    if (globalInt == 1) {
                                      var r = Firestore.instance
                                          .collection('constas')
                                          .document();
                                      r.setData({
                                        'id_ConducteurA': docid,
                                        'id_Constateur': userid
                                      });
                                      constid = r.documentID;
                                      print("constid------>" + constid);
                                    } else if (globalInt == 2) {
                                      Firestore.instance
                                          .collection('constas')
                                          .document()
                                          .setData({
                                        'id_ConducteurB': docid,
                                      });
                                    }

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Infosvehicule(
                                              docid: docid, constid: constid),
                                        ));
                                  },
                                  child: Icon(
                                    Icons.trending_flat_rounded,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ));
        });
  }

  Stream<DocumentSnapshot> StreamGetuserdoc(BuildContext context) async* {
    yield* Firestore.instance
        .collection('utilisateurs')
        .document(docid)
        .snapshots();
  }
}
