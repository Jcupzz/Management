import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices_Post{
  String user_name;
  String user_id;
  String image_link;//firebase storage link
  String _caption;//caption of the post
  DateTime _remainder_time;//remainder time of the post
  DateTime _posted_time;//Time of posting

  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference C_Ref = FirebaseFirestore.instance.collection("Post");

  
  
  DatabaseServices_Post(String _caption,DateTime _remainder_time,DateTime _posted_time)
  {
    this._caption = _caption;
    this._remainder_time = _remainder_time;
    this._posted_time = _posted_time;
  }

  String get caption => _caption;

  set caption(String value) {
    _caption = value;
  }


  DateTime get remainder_time => _remainder_time;

  DateTime get posted_time => _posted_time;

  set posted_time(DateTime value) {
    _posted_time = value;
  }

  set remainder_time(DateTime value) {
    _remainder_time = value;
  }
  Future<void> upload_post() async
  {
    await C_Ref.add({
      'caption': _caption,
      'remainder_time':_remainder_time,
      'posted_time':_posted_time,
    }).then((value) => print('added')).catchError((onError)=>print("Failed $onError"));
  }
}
