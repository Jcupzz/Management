import 'package:cce/Constants/MyTextStyle.dart';
import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool iseditable = false;
  String sem = 'S1';
  String branch = 'CSE';

  @override
  Widget build(BuildContext context) {
    return iseditable
        ? Scaffold(
            backgroundColor: COLORS.colorBackground,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(color: COLORS.colorText, fontSize: 20),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images5.alphacoders.com/423/thumb-1920-423529.jpg"),
                          radius: 80.0,
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Branch",
                            style: MyTextStyle.edit_profile_title,
                          ),
                          DropdownButton<String>(
                            value: branch,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                branch = newValue;
                              });
                            },
                            items: <String>['CSE', 'CE', 'EC', 'EEE', 'ME']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            // onChanged: null
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                              "Scheme",
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
                                              "2015",
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
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: COLORS.colorPrimaryDark),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ListTile(
                                dense: true,
                                leading: Icon(
                                  Icons.person,
                                  size: 35,
                                  color: COLORS.colorBackground,
                                ),
                                title: Text(
                                  "ID",
                                  style: MyTextStyle.profile_title,
                                ),
                                subtitle: Text(
                                  "2019035",
                                  style: MyTextStyle.profile_content,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                leading: Icon(
                                  Icons.alternate_email,
                                  size: 35,
                                  color: COLORS.colorBackground,
                                ),
                                title: Text(
                                  "Email",
                                  style: MyTextStyle.profile_title,
                                ),
                                subtitle: Text(
                                  "jcupzz255@gmail.com",
                                  style: MyTextStyle.profile_content,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                leading: Icon(
                                  Icons.phone,
                                  size: 35,
                                  color: COLORS.colorBackground,
                                ),
                                title: Text(
                                  "Phone",
                                  style: MyTextStyle.profile_title,
                                ),
                                subtitle: Text(
                                  "8129720659",
                                  style: MyTextStyle.profile_content,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
