import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'UserInputPage2.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class joinPage extends StatefulWidget {
  const joinPage({Key? key}) : super(key: key);

  @override
  _joinPageState createState() => _joinPageState();
}

class _joinPageState extends State<joinPage> {
  var inputE = TextEditingController();
  var inputPW = TextEditingController();
  var inputName = TextEditingController();

  getJoin(id, pw, name) async {
    try {
      var result =
          await auth.createUserWithEmailAndPassword(email: id, password: pw);
      result.user?.updateDisplayName(name);
      print(result.user);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: inputName,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '이름',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: inputE,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '이메일',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: inputPW,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '패스워드',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              getJoin(inputE.text, inputPW.text, inputName.text);
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return UserInputPage2();
              }));
            },
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: Text('회원가입', style: TextStyle(fontSize: 30)),
            ),
          ),
        ],
      ),
    ));
  }
}
