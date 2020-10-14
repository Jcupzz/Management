import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MECH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 15,
            child: Lottie.asset("assets/lottie/mech_lottie.json",
                width: double.infinity, height: double.infinity),
          ),
          Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    "Mechanical Engineering",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sans",
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
        ],
      ),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}
