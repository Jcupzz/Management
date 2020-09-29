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
  String branch = 'Computer Science';
  String scheme = '2015';
  String _name;
  String _id;
  String _phone;

  @override
  Widget build(BuildContext context) {
    return iseditable
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: COLORS.colorPrimary,
              title: Text("Edit Profile"),
              centerTitle: true,
              leading: IconButton(
                  splashColor: Colors.redAccent,
                  tooltip: "Cancel",
                  iconSize: 30,
                  icon: Icon(Icons.clear),
                  color: Colors.red,
                  onPressed: () {
                    // Future.delayed(const Duration(milliseconds: 100), () {
                    //   setState(() {
                    //     iseditable = false;
                    //   });
                    // });
                    setState(() {
                      iseditable = false;
                    });
                  }),
              actions: [
                IconButton(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    splashColor: Colors.greenAccent,
                    tooltip: "Done",
                    iconSize: 30,
                    icon: Icon(Icons.done),
                    color: Colors.greenAccent,
                    onPressed: () {
                      setState(() {
                        iseditable = false;
                      });
                    }),
              ],
            ),
            backgroundColor: COLORS.colorBackground,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     IconButton(
                    //         splashColor: Colors.redAccent,
                    //         tooltip: "Cancel",
                    //         iconSize: 24,
                    //         icon: Icon(Icons.clear),
                    //         color: Colors.red,
                    //         onPressed: () {}),
                    //     Text(
                    //       "Edit Profile",
                    //       style:
                    //           TextStyle(color: COLORS.colorText, fontSize: 20),
                    //     ),
                    //     IconButton(
                    //         splashColor: Colors.greenAccent,
                    //         tooltip: "Done",
                    //         iconSize: 24,
                    //         icon: Icon(Icons.done),
                    //         color: Colors.greenAccent,
                    //         onPressed: () {}),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images5.alphacoders.com/423/thumb-1920-423529.jpg"),
                        radius: 80.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 3),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 15,
                              color: COLORS.colorText,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'This cannot be empty!' : null,
                      onSaved: (input) {
                        _name = input;
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: COLORS.colorAccent,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        hintText: "Name",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: "Sans",
                            color: COLORS.colorText),
                        fillColor: COLORS.colorPrimaryDark,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1, color: COLORS.colorAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              width: 1, color: COLORS.colorPrimaryDark),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 3),
                        child: Text(
                          "Branch",
                          style: TextStyle(
                              fontSize: 15,
                              color: COLORS.colorText,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: COLORS.colorPrimaryDark,
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: DropdownButton<String>(
                          value: branch,
                          isExpanded: true,
                          isDense: false,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: COLORS.colorPrimaryDark,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          underline: SizedBox(),
                          dropdownColor: COLORS.colorPrimary,
                          onChanged: (String newValue) {
                            setState(() {
                              branch = newValue;
                            });
                          },
                          items: <String>[
                            'Computer Science',
                            'Electronics Engineering',
                            'Mechanical Engineering',
                            'Civil Engineering',
                            'Electrical Engineering'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: COLORS.colorText,
                                  fontFamily: "Sans",
                                ),
                              ),
                            );
                          }).toList(),
                          // onChanged: null
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 3),
                        child: Text(
                          "Semester",
                          style: TextStyle(
                              fontSize: 15,
                              color: COLORS.colorText,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: COLORS.colorPrimaryDark,
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: DropdownButton<String>(
                          value: sem,
                          isExpanded: true,
                          isDense: false,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: COLORS.colorBackground,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          underline: SizedBox(),
                          dropdownColor: COLORS.colorPrimary,
                          onChanged: (String newValue) {
                            setState(() {
                              sem = newValue;
                            });
                          },
                          items: <String>[
                            'S1',
                            'S2',
                            'S3',
                            'S4',
                            'S5',
                            'S6',
                            'S7',
                            'S8'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: COLORS.colorText,
                                  fontFamily: "Sans",
                                ),
                              ),
                            );
                          }).toList(),
                          // onChanged: null
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 3),
                        child: Text(
                          "Scheme",
                          style: TextStyle(
                              fontSize: 15,
                              color: COLORS.colorText,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: COLORS.colorPrimaryDark,
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: DropdownButton<String>(
                          value: scheme,
                          isExpanded: true,
                          isDense: false,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: COLORS.colorBackground,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          underline: SizedBox(),
                          dropdownColor: COLORS.colorPrimary,
                          onChanged: (String newValue) {
                            setState(() {
                              scheme = newValue;
                            });
                          },
                          items: <String>[
                            '2015',
                            '2019',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: COLORS.colorText,
                                  fontFamily: "Sans",
                                ),
                              ),
                            );
                          }).toList(),
                          // onChanged: null
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 3),
                        child: Text(
                          "ID",
                          style: TextStyle(
                              fontSize: 15,
                              color: COLORS.colorText,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'This cannot be empty!' : null,
                      onSaved: (input) {
                        _id = input;
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: COLORS.colorAccent,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        hintText: "ID",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: "Sans",
                            color: COLORS.colorText),
                        filled: true,
                        fillColor: COLORS.colorPrimaryDark,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1, color: COLORS.colorAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              width: 1, color: COLORS.colorPrimaryDark),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 3),
                        child: Text(
                          "Phone",
                          style: TextStyle(
                              fontSize: 15,
                              color: COLORS.colorText,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'This cannot be empty!' : null,
                      onSaved: (input) {
                        _phone = input;
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: COLORS.colorAccent,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        hintText: "Phone",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: "Sans",
                            color: COLORS.colorText),
                        fillColor: COLORS.colorPrimaryDark,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1, color: COLORS.colorAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              width: 1, color: COLORS.colorPrimaryDark),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
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
