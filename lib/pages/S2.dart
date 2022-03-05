import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter_tindercard/flutter_tindercard.dart';

import 'detailPage.dart';

class S2 extends StatefulWidget {
  const S2({Key? key}) : super(key: key);
  @override
  _S2State createState() => _S2State();
}

class _S2State extends State<S2> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);

  Future getposts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("dating").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    List<String> welcomeImages = [
      "https://image.newsis.com/2021/05/18/NISI20210518_0000749062_web.jpg",
      "http://cdnimage.dailian.co.kr/news/201704/news_1492649247_627464_m_1.jpg",
      "https://w.namu.la/s/544797e62178da4ade717cc1ea6d99c56fb11a6b11230a44e81e49bca2f3166f242d8a89360d6a35d53196e1cdee790d5149aaba77d3ad6eee0abf580e427742faf36ee42b5404e3dbccdcf0d75952dca94e15f2b3fb62ed3cbeebdde66b17f5",
      "https://file2.nocutnews.co.kr/newsroom/image/2019/07/19/20190719214943166897_0_777_1166.jpg",
      "https://img.etoday.co.kr/pto_db/2020/02/600/20200226105956_1429035_800_1200.jpg",
      "https://news.nateimg.co.kr/orgImg/su/2020/07/02/366028_460825_0034.jpg"
    ];

    CardController controller;

    return Container(
      child: FutureBuilder(
        future: getposts(),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(bottom: 120),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: TinderSwapCard(
                  swipeUp: true,
                  swipeDown: true,
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: snapshot.data.length,
                  stackNum: 2,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.width,
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  minHeight: MediaQuery.of(context).size.width * 0.9,
                  cardBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data[index].data()["img"]),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    ),
                  ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    if (align.x < 0) {
                      // print('Nope');
                    } else if (align.x > 0) {
                      // print('like');
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    print(orientation.toString());
                    if (orientation == CardSwipeOrientation.LEFT) {
                      print('Nope');
                    } else if (orientation == CardSwipeOrientation.RIGHT) {
                      print('like');
                    }
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
