import 'dart:io';
import 'package:cce/Constants/Loading.dart';
import 'package:cce/Models/Post.dart';
import 'package:cce/Pages/home.dart';
import 'package:cce/Post_Feed_Pages/DatabaseServices_Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

class Add_Post extends StatefulWidget {
  @override
  _Add_PostState createState() => _Add_PostState();
}

class _Add_PostState extends State<Add_Post> {
  String description; // String to store caption
  int pcdd_val = 0; //post_category_drop_down_value
  File _image; // image post location in device
  dynamic remainderDate; // remainder time
  DatabaseServices_Post databaseServices_Post = new DatabaseServices_Post();
  HomeScreen homeScreen = new HomeScreen();

  //

  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print("_image: $_image");
    });
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("New Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Row(
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     Text("Add a new "),
            //     DropdownButton(
            //         items: [
            //           DropdownMenuItem(
            //             child: Text("Post"),
            //             value: 0,
            //           ),
            //           DropdownMenuItem(
            //             child: Text("Announcement"),
            //             value: 1,
            //           ),
            //           DropdownMenuItem(
            //             child: Text("Celebration"),
            //             value: 2,
            //           ),
            //         ],
            //         onChanged: (value) {
            //           pcdd_val = value;
            //         })
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 20, 14, 0),
              child: TextField(
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Sans',
                ),
                decoration: InputDecoration(
                  hintText: 'Captions here...',
                  border: InputBorder.none,
                ),
                minLines: 8,
                maxLines: 8,
                expands: false,
                onChanged: (caption_value) {
                  description = caption_value;
                },
              ),
            ),
            Divider(
              color: Colors.grey[600],
            ),
            InkWell(
              onTap: () => getImage(),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Center(
                    child: _image == null
                        ? Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 80,
                          )
                        : Image.file(_image)),
              ),
            ),
            Divider(
              color: Colors.grey[600],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Text(
                "Set Remainder",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Droid Sans',
                    color: Theme.of(context).accentColor),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[600])),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.info_outline_rounded, size: 18),
                      ),
                      TextSpan(
                        text:
                            "  Select the time to remind the event to the user. Preferred to select a time before the event begins",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Sans',
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      //

                      DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onChanged: (date) {
                          print('change $date in time zone ' +
                              date.timeZoneOffset.inHours.toString());
                        },
                        onConfirm: (confirmed_date) {
                          print('confirm $confirmed_date');
                          remainderDate = confirmed_date;
                          print("date successfully: $remainderDate");
                        },
                        currentTime: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day, 12, 0),
                        minTime: DateTime(2020, 10, 1),
                        maxTime: DateTime(2024, 12, 31),
                      );

                      //
                    },
                    color: Colors.grey[600],
                    child: Text("Set Remainder"))),

            Divider(
              color: Colors.grey[600],
            ),

            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () async {
                      // TODO : CircularProgressIndicator
                      
                      Navigator.pop(context);
                      if (_image != null &&
                          description.length != 0 &&
                          remainderDate != null) {
                        print("reached here at last");
                        // await databaseServices_Post
                        //     .upload_post(
                        //         caption, remainder_time, DateTime.now(), _image)
                        //     .then((value) {
                        //   if (value == true) {
                        //     print('reached navigator!thank you god!!!');
                        //   } else {
                        //     print("Error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                        //   }
                        // });
                        String url = await databaseServices_Post.getUrlOfPost(_image);
                        Post post = new Post(url, description, DateTime.now(), remainderDate);
                        await post.uploadPost();
                      }
                    },
                    color: Colors.grey[600],
                    child: Text("Post"))),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  setRemainder() {}

}
