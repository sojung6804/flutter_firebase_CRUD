import 'package:flutter/material.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key}) : super(key: key);

  @override
  _UserInputPageState createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // Image.file(),
        TextField(onChanged: (text) {}),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.send))
      ],
    ));
  }
}