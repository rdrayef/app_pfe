
import 'package:accidenyally/ajouter.dart';
import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/Information_vehicule.dart';
import 'package:accidenyally/info_vehcl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:loading_indicator/loading_indicator.dart';
class Addvh extends StatefulWidget {

  @override
  _AddvhState createState() => _AddvhState();
}

class _AddvhState extends State<Addvh> {
  
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
          backgroundColor: bluecolors2,
          elevation: 0,
          title: Text("      ajouter vehicule",style: TextStyle(color: bluecolor),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: bluecolor,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.drive_eta_outlined,
                color: bluecolor,
              ),
              onPressed: () {
               
              }
            ),
          ],
        ),
        backgroundColor: bluecolors2,
        body:  Column(
          children: [
            Container(
              child: BTN(context)
            ),
           Container(child:  Expanded(
                        child: StreamBuilder(
                          
                            stream: StreamGetuserdoc(context),
                            builder:
                                (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                    child: LoadingIndicator(
                                      indicatorType: Indicator.ballPulse,
                                      color: Colors.orange,
                                    ),
                                  ),
                                );
                              }
                              return ListView.builder(
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (context, index) {
                                    return vhi(
                                        snapshot.data.documents[index]['marque'],
                                        snapshot.data.documents[index]['carburant'],
                                        snapshot.data.documents[index].documentID,
                                      );
                                  });
                            }
                            ),
           ), 
                          
           )
          ],
        ),
    );
  }
  Widget vhi( String marque,String carb,String id) {
   return  Card(
                   elevation: 5,
                             child: Row(children: [
                               Container(
                                 height: 140,
                                 width: 125,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5)

                                   ),
                                   image: DecorationImage(
                                     fit: BoxFit.cover,
                                     image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/accidentally-d3dca.appspot.com/o/Transpo_G70_TA-518126.jpg?alt=media&token=e7fbc043-7cf7-4720-8bdb-342f0ec552a6'),
                                   ),
                                 ),
                               ),
                               Container(
                               padding: EdgeInsets.all(10),
                               height: 130,
                               child: Column(children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right: 160),
                                   child: Text(marque,
                                   style: TextStyle(fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                   ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 155,top: 10),
                                   child: Text(carb,
                                   style: TextStyle(fontSize: 16,
                                   fontWeight: FontWeight.w200,
                                   ),
                                   ), 
                                 ),
                               Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 120),
                                  child: IconButton(
                                 
                                  color: bluecolor, onPressed: () {  
                                    print(id);
                                     Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Infovoiture(
                                            id:id
                                            ),
                                          ));
                                  }, icon: Icon( Icons.arrow_forward_ios,),
                                  ),
                                )
                               ],),
                                                      ),
                             ],
                             ),
                           );
                         
                 
             
 
}
}
Stream<QuerySnapshot> StreamGetuserdoc(BuildContext context) async* {
   final uid = (await FirebaseAuth.instance.currentUser()).uid;
      yield* Firestore.instance
      .collection('utilisateurs')
      .document(uid)
      .collection('vehicule')
      .snapshots();
 
  }
 Widget BTN(BuildContext context) {
   
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: RaisedButton(
            color: bluecolor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage1()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.height * 0.428,
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Nouveau Vehicule",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.32),
                    child: Icon(
                      Icons.person_add_alt_1_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
      );
    }