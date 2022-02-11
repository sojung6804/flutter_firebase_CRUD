import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'UserInputPage.dart';

final firestore = FirebaseFirestore.instance;

var picker = ImagePicker();

class S1 extends StatefulWidget {
  const S1({Key? key}) : super(key: key);
  @override
  _S1State createState() => _S1State();
}

class _S1State extends State<S1> {
  var fbData;

  Future<void> getData() async {
    var result = await firestore.collection('profile').get();
    setState(() {
      fbData = result.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  final picker = ImagePicker();

  var pfimg;

  @override
  Widget build(BuildContext context) {
    if (fbData != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('피드'),
          actions: [
            IconButton(
                onPressed: () async {
                  var picker = ImagePicker();
                  dynamic image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    dynamic ii = File(image.path);
                    setState(() {
                      pfimg = ii;
                    });
                  }

                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return UserInputPage(pfimg: pfimg);
                  }));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: fbData.length,
            itemBuilder: (c, i) {
              return Column(children: [
                fbData[i]["img"].runtimeType == String
                    ? Image.network(
                        fbData[i]["img"],
                      )
                    : Image.file(
                        fbData[i]["img"],
                      ),
                Text(fbData[i]["name"])
              ]);
            }),
      );
    } else {
      return Text('로딩중임');
    }
  }
}
