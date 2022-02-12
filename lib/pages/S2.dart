import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class S2 extends StatefulWidget {
  const S2({Key? key}) : super(key: key);

  @override
  _S2State createState() => _S2State();
}

class _S2State extends State<S2> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Profile",
      style: optionStyle,
    );
  }
}
