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

  goFire() async {
    var storageRef = storage.ref();
    var savePath = storageRef.child('image/' + inputT.text);
    var uploading = savePath.putFile(widget.pfimg);

    try {
      (await uploading).ref.getDownloadURL().then((url) {
        var saveData = {'name': inputT.text, 'img': url};
        db.collection('profile').add(saveData);
      });
    } catch (e, s) {
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
              goFire();

              Navigator.pop(context);
            },
            icon: Icon(Icons.send))
      ],
    ));
  }
}
