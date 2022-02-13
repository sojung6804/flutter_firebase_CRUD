import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  const detailPage({Key? key, this.fbData}) : super(key: key);
  final fbData;
  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: false, // appbar 완전히 사라지게
        expandedHeight: 250.0, // appbar 크기
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            '타이틀',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          centerTitle: true,
          background: Image.network(widget.fbData[0]['img']),
        ),
      ),
    ]));
  }
}
