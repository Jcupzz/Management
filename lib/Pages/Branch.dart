import 'package:carousel_slider/carousel_slider.dart';
import 'package:cce/Branch_Pages/CE.dart';
import 'package:cce/Branch_Pages/CS.dart';
import 'package:cce/Branch_Pages/EC.dart';
import 'package:cce/Branch_Pages/EEE.dart';
import 'package:cce/Branch_Pages/MECH.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Branch extends StatefulWidget {
  @override
  _BranchState createState() => _BranchState();
}

class _BranchState extends State<Branch> {
  List cardList = [CS(), EC(), MECH(), CE(), EEE()];
  List branchList = [
    "Computer Science",
    "Electronics Engineering",
    "Mechanical Engineering",
    "Civil Engineering",
    "Electrical Engineering"
  ];
  int _currentIndex;
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CCE NOTES"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 120),
            child: CarouselSlider(
                items: cardList.map((card) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
            
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width,
                      child: card,
                      //Card(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20.0)),
                      //   elevation: 14,
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     child: card,
                      //   ),
                      //   color: Theme.of(context).cardColor,
                      //   // child: Lottie.asset(card,width: double.infinity,height: double.infinity),
                      // ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: double.infinity,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 20),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                )),
          ),
        ));
  }
}
