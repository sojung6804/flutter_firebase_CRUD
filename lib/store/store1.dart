import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Store1 extends ChangeNotifier {

  var UserImage;

  addUI(u) {
    UserImage = u;
    notifyListeners();
  }

}
