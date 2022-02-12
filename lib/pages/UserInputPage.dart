import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

final storage = FirebaseStorage.instance;

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key, this.pfimg}) : super(key: key);
  final pfimg;

  @override
  _UserInputPageState createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  var inputT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.file(widget.pfimg),
        TextField(
          controller: inputT,
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        IconButton(
            onPressed: () {
              var storageRef = storage.ref();
              var storagePath = storageRef.child('image/' + inputT.text);
              var storageUpload = storagePath.putFile(widget.pfimg);

              Navigator.pop(context);
            },
            icon: Icon(Icons.send))
      ],
    ));
  }
}
