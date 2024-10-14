import 'package:flutter/material.dart';
import 'package:myprovider/model.dart';

//step1
class Mapprovider extends ChangeNotifier {
//data
  List<Map<String, dynamic>> _mData = [];

  //events
  void addMap(NoteModel values) {
    _mData.add(values.ModeltoMap());
    notifyListeners();
  }

//get
  List<Map<String, dynamic>> getMap() {
    return _mData;
  }
}
