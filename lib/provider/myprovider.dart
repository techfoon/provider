import 'package:flutter/material.dart';


//step1
class myprovider extends ChangeNotifier {
//data
  int _count = 0;

  //events
  void incrementCount() {
    _count++;

    notifyListeners();
  }

//get
  int getValue() {
    return _count;
  }
}
