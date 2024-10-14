import 'package:flutter/material.dart';

class NoteModel {
  String title;
  String desc;

  NoteModel({required this.title, required this.desc});

  //Map to Model or FromMap
  factory NoteModel.MaptoModel(Map<String, dynamic> map) {
    return NoteModel(title: map['title'], desc: map['description']);
  }

  //ModeltoMap or ToMap
  Map<String, dynamic> ModeltoMap() {
    return {'title': title, 'description': desc};
  }
}
