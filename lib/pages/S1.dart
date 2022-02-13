import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'UserInputPage.dart';
import 'detailPage.dart';

final firestore = FirebaseFirestore.instance;

var picker = ImagePicker();

class S1 extends StatefulWidget {
  const S1({Key? key}) : super(key: key);
  @override
  _S1State createState() => _S1State();
}

class _S1State extends State<S1> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);
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
              return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                            image: NetworkImage(fbData[i]["img"]),
                            fit: BoxFit.fitWidth),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(20))),
                    width: double.maxFinite,
                    height: 300,
                    child: Align(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          fbData[i]["name"],
                          style: optionStyle,
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return detailPage();
                    }));
                  });
            }),
      );
    } else {
      return Text('로딩중임');
    }
  }
}
