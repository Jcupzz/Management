import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MECH extends StatefulWidget {
  @override
  _MECHState createState() => _MECHState();
}

class _MECHState extends State<MECH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: Lottie.asset("assets/lottie/mech_lottie.json",
                width: double.infinity, height: double.infinity),
          ),
          Divider(),
          Flexible(
              flex: 1,
              child: Text(
                "Mechanical Engineering",
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    backgroundColor: COLORS.colorCard,);
  }
}
