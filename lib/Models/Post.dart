import 'dart:io';

import 'package:cce/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'User.dart';

class Post {
  String url;
  String description;

  //User user;
  //List<User> likes;
  //List<Comments> comments;
  DateTime date;
  DateTime remainderDate;

  //bool isLiked;
  //bool isSaved;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Post(this.url, this.description, this.date, this.remainderDate);

  Future uploadPost() async {
    String uid = _auth.currentUser.uid;
    DocumentReference D_Ref = FirebaseFirestore.instance
        .collection("Posts")
        .doc("$userId")
        .collection("$uid")
        .doc();
    String doc_ID = D_Ref.id.toString();
    await D_Ref.set({
      'description': description,
      'date': date,
      'remainderDate': remainderDate,
      'url': url,
      'doc_ID': doc_ID,
    }).then((value) => print("Success"));
  }




}
