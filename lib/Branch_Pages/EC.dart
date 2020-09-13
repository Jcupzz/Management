import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EC extends StatefulWidget {
  @override
  _ECState createState() => _ECState();
}

class _ECState extends State<EC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.colorCard,
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: Lottie.asset("assets/lottie/ec_lottie.json",
                width: double.infinity, height: double.infinity),
          ),
          Divider(),
          Flexible(
              flex: 1,
              child: Text(
                "Electrical Engineering",
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
