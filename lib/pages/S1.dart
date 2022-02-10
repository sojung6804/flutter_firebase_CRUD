import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

class S1 extends StatefulWidget {
  const S1({Key? key}) : super(key: key);
  @override
  _S1State createState() => _S1State();
}

class _S1State extends State<S1> {
  var fbData;

  getData() async {
    var result = await firestore.collection('profile').get();
    setState(() {
      fbData = result.docs;
    });
    print(fbData);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Text("feed");
  }
}
