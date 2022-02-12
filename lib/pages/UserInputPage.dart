import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
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
              db.collection('profile').add({'name': inputT});

              Navigator.pop(context);
            },
            icon: Icon(Icons.send))
      ],
    ));
  }
}
