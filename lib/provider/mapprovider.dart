import 'package:flutter/material.dart';

//step1
class Mapprovider extends ChangeNotifier {
//data
  List<Map<String, dynamic>> _mData = [];

  //events
  void addMap(Map<String, dynamic> values) {
    _mData.add(values);
    notifyListeners();
  }

//get
  List<Map<String, dynamic>> getMap() {
    return _mData;
  }
}
