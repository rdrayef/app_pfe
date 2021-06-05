import 'package:accidenyally/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class drpdwn_imm extends StatelessWidget {
  const drpdwn_imm(String docid, {Key key, this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String _selectedcarb;
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("utilisateurs").snapshots(),
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
                            "Sélectionnez une marque",
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
                      labelStyle: TextStyle(
                          color: Colors.indigo[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: bluecolor,
                    ),
                    items: carbItems,
                    onChanged: (currencyValue) {
                      _selectedcarb = currencyValue;
                      print(currencyValue);
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

/*   StreamBuilder<QuerySnapshot>(
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
                  }), */
}
