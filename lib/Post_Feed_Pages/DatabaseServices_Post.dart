import 'package:cce/Models/Post.dart';
import 'package:cce/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DatabaseServices_Post {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference C_Ref = FirebaseFirestore.instance.collection("Posts");
  StorageReference _storageReference;
  Post post;

  bool upload_checker = false;

  Future<String> getUrlOfPost(File _image) async {
    _storageReference = FirebaseStorage.instance
        .ref()
        .child("Posts")
        .child("$userId")
        .child('${DateTime.now().millisecondsSinceEpoch}');
    StorageUploadTask storageUploadTask = _storageReference.putFile(_image);
    storageUploadTask.events.listen((event) {});
    String url =
        await (await storageUploadTask.onComplete).ref.getDownloadURL();
    return url;
  }



// await C_Ref.add({
//   'description': post.description,
//   'remainderDate': post.remainderDate,
//   'date': post.date,
//   'url': url,
// }).then((value) {
//   print('Added ' + value.toString());
//   upload_checker = true;
// }).catchError((onError) {
//   print("Failed $onError");
//   upload_checker = false;
// });
// map = {
//     'description': post.description,
//     'remainderDate': post.remainderDate,
//     'date': post.date,
//     'url': url,
// };
//      await C_Ref.doc("$userId").set(map).then((value) => print("Success"));

}
