import 'dart:io';

import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/verification/G%C3%A9olocalisation/degats.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepage extends StatefulWidget {
  @override
  _ImagepageState createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> {
  File _image;
  File _image1;
  File _image2;
  File _image3;

  @override
  Widget build(BuildContext context) {
    Future getImage1(BuildContext context) async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future getImage2(BuildContext context) async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image1 = image;
        print('Image Path $_image1');
      });
    }

    Future getImage3(BuildContext context) async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image2 = image;
        print('Image Path $_image2');
      });
    }

    Future getImage4(BuildContext context) async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image3 = image;
        print('Image Path $_image3');
      });
    }

    Size devwidth = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Ajouter des photos",
              style: TextStyle(
                  color: bluecolor, fontSize: 23, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.camera_alt,
              size: 25,
              color: rougggecolor,
            ),
            onPressed: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 170, bottom: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: new SizedBox(
                              width: 150.0,
                              height: 160.0,
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
                                        getImage1(context);
                                      },
                                    )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 170, bottom: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: new SizedBox(
                              width: 150.0,
                              height: 160.0,
                              child: (_image1 != null)
                                  ? Image.file(
                                      _image1,
                                      fit: BoxFit.fill,
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.add_a_photo,
                                        size: 25,
                                        color: rougggecolor,
                                      ),
                                      onPressed: () {
                                        getImage2(context);
                                      },
                                    )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 170, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: new SizedBox(
                              width: 150.0,
                              height: 160.0,
                              child: (_image2 != null)
                                  ? Image.file(
                                      _image2,
                                      fit: BoxFit.fill,
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.add_a_photo,
                                        size: 25,
                                        color: rougggecolor,
                                      ),
                                      onPressed: () {
                                        getImage3(context);
                                      },
                                    )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 170, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: new SizedBox(
                              width: 150.0,
                              height: 160.0,
                              child: (_image3 != null)
                                  ? Image.file(
                                      _image3,
                                      fit: BoxFit.fill,
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.add_a_photo,
                                        size: 25,
                                        color: rougggecolor,
                                      ),
                                      onPressed: () {
                                        getImage4(context);
                                      },
                                    )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: devwidth.width / 1.6,
                    right: devwidth.width * 0.045,
                    top: devwidth.height * 0.55),
                child: SizedBox(
                    height: 50,
                    width: 120,
                    child: RaisedButton(
                      color: bluecolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Degats()));
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
        ),
      ),
    );
  }
}
