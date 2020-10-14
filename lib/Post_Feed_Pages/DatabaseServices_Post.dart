import 'package:cce/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DatabaseServices_Post {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference C_Ref = FirebaseFirestore.instance.collection("Post");
  StorageReference _storageReference;

  bool upload_checker = false;

  

  Future<bool> upload_post(String caption, DateTime remainder_time,
      DateTime posted_time, File image) async {
    _storageReference = FirebaseStorage.instance
        .ref()
        .child("Post")
        .child("$userId")
        .child('${DateTime.now().millisecondsSinceEpoch}');
    StorageUploadTask storageUploadTask = _storageReference.putFile(image);
    storageUploadTask.events.listen((event) {
      
    });
    var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();

    if (url != null) {
      await C_Ref.add({
        'caption': caption,
        'remainder_time': remainder_time,
        'posted_time': posted_time,
        'url': url,
      }).then((value) {
        print('Added ' + value.toString());
        upload_checker = true;
      }).catchError((onError) {
        print("Failed $onError");
        upload_checker = false;
      });
    }

    return upload_checker;
  }
}
