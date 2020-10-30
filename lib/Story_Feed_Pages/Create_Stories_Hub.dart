import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Create_Stories_Hub extends StatefulWidget {
  @override
  _Create_Stories_HubState createState() => _Create_Stories_HubState();
}

class _Create_Stories_HubState extends State<Create_Stories_Hub> {
  File _image;
  String stories_hub_title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Create Stories Hub"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(14, 20, 14, 0),
              child: TextField(
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Sans',
                ),
                decoration: InputDecoration(
                  hintText: 'Enter the stories hub title here...',
                  border: InputBorder.none,
                ),
                minLines: 2,
                maxLength: 8,
                maxLines: 2,
                expands: false,
                onChanged: (title) {
                  stories_hub_title = title;
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
                            " Choose an image with size ratio 1:1. This image is used for setting thumbnail of stories hub. You can later change this image in the edit settings of stories hub",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Sans',
                        ),
                      ),
                    ],
                  ),
                )),
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
                          stories_hub_title.length != 0
                          ) {
                        print("reached here at last");
                        // String url = await databaseServices_Post.getUrlOfPost(_image);
                        // Post post = new Post(url, description, DateTime.now(), remainderDate);
                        // await post.uploadPost();
                      }
                    },
                    color: Colors.grey[600],
                    child: Text("Next"))),
          ],
        ),
      ),
    );
  }

  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print("_image: $_image");
    });
  }
}
