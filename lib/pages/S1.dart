import 'package:flutter/material.dart';

class S1 extends StatefulWidget {
  const S1({Key? key}) : super(key: key);

  @override
  _S1State createState() => _S1State();
}

class _S1State extends State<S1> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Text(
      "feed",
      style: optionStyle,
    );
  }
}
