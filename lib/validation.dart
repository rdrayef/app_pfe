import 'package:accidenyally/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Validation extends StatefulWidget {
  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluecolor,
      body: Container(
        child: Column(
          children: [
            SizedBox(
                height: 50,
                width: 120,
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  child: Icon(
                    Icons.trending_flat_rounded,
                    color: Colors.white,
                    size: 45,
                  ),
                )),
            SizedBox(
                height: 50,
                width: 120,
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  child: Icon(
                    Icons.trending_flat_rounded,
                    color: Colors.white,
                    size: 45,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
