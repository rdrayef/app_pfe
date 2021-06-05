import 'package:accidenyally/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Service extends StatelessWidget {
  singleCard(iconcode, icontitle) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: 130,
        height: 100,
        child: Card(
          color: services_blue,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconcode,
                  size: 55,
                  color: Colors.deepPurple[700],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  icontitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: bluecolor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: rougecolor,
                  size: 30,
                )
              ],
            ),
          ),
          shadowColor: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            child: Stack(children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 130,
                        height: 100,
                        child: Card(
                          color: services_blue,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.0),
                          ),
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.support_agent_rounded,
                                  size: 55,
                                  color: Colors.deepPurple[700],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Assistance',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: bluecolor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: rougecolor,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          shadowColor: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 130,
                        height: 100,
                        child: Card(
                          color: services_blue,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.0),
                          ),
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.home_work_outlined,
                                  size: 55,
                                  color: Colors.deepPurple[700],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Agences',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: bluecolor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: rougecolor,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          shadowColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 120, vertical: 115),
                child: Padding(
                  child: GestureDetector(
                    onTap: () => {},
                    child: Container(
                      width: 130,
                      height: 100,
                      child: Card(
                        color: services_blue,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.car_repair,
                                size: 55,
                                color: Colors.deepPurple[700],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Conseils de sinistre',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: bluecolor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: rougecolor,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        shadowColor: Colors.grey,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 265),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 130,
                        height: 100,
                        child: Card(
                          color: services_blue,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.0),
                          ),
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.perm_phone_msg_outlined,
                                  size: 55,
                                  color: Colors.deepPurple[700],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Contact',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: bluecolor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: rougecolor,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          shadowColor: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 130,
                        height: 100,
                        child: Card(
                          color: services_blue,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.0),
                          ),
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.question_answer_outlined,
                                  size: 55,
                                  color: Colors.deepPurple[700],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'FAQ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: bluecolor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: rougecolor,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          shadowColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
