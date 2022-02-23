import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'UserInputPage2.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var inputID = TextEditingController();
  var inputPW = TextEditingController();
  var inputNick = TextEditingController();

  getLogin() async {
    try {
      var result = await auth.createUserWithEmailAndPassword(
          email: "sojung@naver.com", password: "123456");
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
              controller: inputNick,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '닉네임',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: inputID,
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
              getLogin();
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return UserInputPage2();
              }));
            },
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: Text('로그인', style: TextStyle(fontSize: 30)),
            ),
          ),
        ],
      ),
    ));
  }
}
