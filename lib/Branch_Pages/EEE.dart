import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EEE extends StatefulWidget {
  @override
  _EEEState createState() => _EEEState();
}

class _EEEState extends State<EEE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.colorCard,
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: Lottie.asset("assets/lottie/eee_lottie.json",
                width: double.infinity,
                height: double.infinity),
          ),
          Divider(),
          Flexible(
              flex: 1,
              child: Text(
                "Electrical Engineering",
                style: TextStyle(fontSize: 20),
              )
          ),
        ],
      ),
    );
  }
}
