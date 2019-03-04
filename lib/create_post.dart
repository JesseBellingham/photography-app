import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePost extends StatelessWidget {
  final String imagePath;
  CreatePost({Key key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Post"),
        ),
        body: Container(
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(start: 5.0, end: 5.0, top: 10.0),
            child: ListView(
              children: <Widget>[
                Container(child: Image.file(File(imagePath))),
                RaisedButton(
                  onPressed: _submitCreatePost,
                  child: Text("Create Post"),
                )
              ],
            ),
          ),
        ));
  }

  Future _submitCreatePost() async {
    Position position = await Geolocator().getCurrentPosition();

    Firestore.instance
        .collection('posts')
        .document()
        .setData({'title': 'title', 'author': 'author'});
  }
}
