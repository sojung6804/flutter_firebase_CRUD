import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'detailPage.dart';

class S2 extends StatefulWidget {
  const S2({Key? key}) : super(key: key);
  @override
  _S2State createState() => _S2State();
}

class _S2State extends State<S2> {
  Future getposts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("profile").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getposts(),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  snapshot.data[index].data()["img"]),
                              fit: BoxFit.fitWidth),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(20))),
                      width: double.maxFinite,
                      height: 300,
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data[index].data()['name'],
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return Scaffold(
                            body: CustomScrollView(slivers: <Widget>[
                          SliverAppBar(
                            pinned: false, // appbar 완전히 사라지게
                            expandedHeight: 250.0, // appbar 크기
                            flexibleSpace: FlexibleSpaceBar(
                              title: Text(
                                snapshot.data[index].data()['name'],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              centerTitle: true,
                              background: Image.network(
                                  snapshot.data[index].data()['img']),
                            ),
                          ),
                        ]));
                      }));
                    });
              },
            );
          }
        },
      ),
    );
  }
}
