import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool iseditable = false;

  @override
  Widget build(BuildContext context) {
    return iseditable
        ? Scaffold(
            body: Column(
            children: [
              SafeArea(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      iseditable = false;
                    });
                  },
                  child: Text("done"),
                ),
              )
            ],
          ))
        : Scaffold(
            backgroundColor: COLORS.colorBackground,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                    height: 60,
                    width: 60,
                    child: RaisedButton(
                      color: COLORS.colorAccent,
                      onPressed: () {
                        setState(() {
                          iseditable = true;
                        });
                      },
                      child: Icon(Icons.edit),
                      elevation: 10,
                    ))),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            top: 80,
                            left: 20,
                            right: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Container(
                                color: COLORS.colorPrimaryDark,
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Center(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://images5.alphacoders.com/423/thumb-1920-423529.jpg"),
                                radius: 80.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            color: COLORS.colorPrimaryDark,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                children: [
                                  Text(
                                    "Annon Here",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: COLORS.colorText,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Sans"),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 30, 30, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Branch",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: COLORS.colorText,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Sans"),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "CSE",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: COLORS.colorText,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Sans"),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Semester",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: COLORS.colorText,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Sans"),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "S1",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: COLORS.colorText,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Sans"),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Branch",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: COLORS.colorText,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Sans"),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "CSE",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: COLORS.colorText,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Sans"),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,20),
                        child: Card(
                          color: COLORS.colorPrimaryDark,
                          child:Padding(
                            padding: const EdgeInsets.fromLTRB(20,30,20,20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("ID"),
                                Text("2019035")
                              ],
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ));
  }
}
