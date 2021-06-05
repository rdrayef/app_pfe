import 'package:accidenyally/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Infovoiture extends StatefulWidget {
  final String id;
  Infovoiture({Key key, this.id}) : super(key: key);
  @override
  _InfovoitureState createState() => _InfovoitureState(id:id);
  
}


class _InfovoitureState extends State<Infovoiture> {
  String id;
  _InfovoitureState({this.id});
  /*  Future<void> _getinfovehcl() async {
     final uid = (await FirebaseAuth.instance.currentUser()).uid;
    Firestore.instance
        .collection('utilisateurs')
        .document(uid)
        .collection('vehicule')
        .document()
        .get()
        .then((value) {
      setState(() {
        marque = value.data['marque'];
        immatriculation = value.data['Immatriculation'];
        modele = value.data['modele'];
        type = value.data['type'];
        genre = value.data['genre'];
        carb = value.data['carburant'];
        dmc = value.data['date mise en circulation'];
        nbplace = value.data['nombre de place'];
        puiss = value.data['puissance fiscale'];
        nbcylindre = value.data['nombre de cylindre'];
        nbchassis = value.data['nombre du chassis'];
        poidstotal = value.data['poids total'];
        poidsvide= value.data['poids vide'];

      });
    });
  } */
 
  @override
  Widget build(BuildContext context) {
      
    return StreamBuilder(
        stream: StreamGetuserdoc(context),
     
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Scaffold(
                backgroundColor: Colors.white,
                /* width: MediaQuery.of(context).size.width * 0.1,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  color: Colors.orange,
                ), */
              ),
            );
          }
          print("idreeeeeeeeeeeeeeeeeeeeeeeeeeeed");
          print(id);
         return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.drive_eta,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.indigo[900]),
          ),
          Center(
            child: Card(
              child: Container(
                  height: 640,
                  width: 340,
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Text(
                            "Mon voiture",
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 237, top: 12),
                          child: Text(
                            
                           "Marque",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 243, top: 8),
                          child: Text(
                            
                            snapshot.data['marque'],
                           // snapshot.data['marque'],
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(right: 237, top: 12),
                          child: Text(
                            "modele",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 188, top: 8),
                          child: Text(
                         snapshot.data['modele'],
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(right: 184, top: 12),
                          child: Text(
                            "Immatriculation",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 212, top: 8),
                          child: Text(
                            snapshot.data['Immatriculation'],
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 263, top: 12),
                          child: Text(
                            "Type",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 246, top: 8),
                          child: Text(
                               snapshot.data['type'],
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 178, top: 12),
                          child: Text(
                            "Puissance fiscale",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 260, top: 8),
                          child: Text(
                              snapshot.data['puissance fiscale'],
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 230, top: 12),
                          child: Text(
                            "Carburant",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 252, top: 8),
                          child: Text(
                            "Diesel",
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 132, top: 12),
                          child: Text(
                            "Date mise en circulation",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 199, top: 8),
                          child: Text(
                            "DD/MM/YYYY",
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 209, top: 12),
                          child: Text(
                            "Kélometrage",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 246, top: 8),
                          child: Text(
                            "XXXXX",
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 255, top: 12),
                          child: Text(
                            "Genre",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 246, top: 8),
                          child: Text(
                            "XXABC",
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 184, top: 12),
                          child: Text(
                            "Nombre du place",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 290, top: 8),
                          child: Text(
                            "8",
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 169, top: 12),
                          child: Text(
                            "Numero du chassis",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 248, top: 8),
                          child: Text(
                            "XXXXX",
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),Padding(
                          padding: const EdgeInsets.only(right: 216, top: 12),
                          child: Text(
                            "Poids Totale",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 248, top: 8),
                          child: Text(
                            "XXXXX",
                            style: TextStyle(
                              color: bluecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
            ),
          )
        ],
      ),
      );
        }  
    );
    
    
  }
  Stream<DocumentSnapshot> StreamGetuserdoc(BuildContext context) async* {
   final uid = (await FirebaseAuth.instance.currentUser()).uid;
      yield* Firestore.instance
      .collection('utilisateurs')
      .document(uid)
      .collection('vehicule')
      .document(id)
      .snapshots();
  }
}
