// ignore_for_file: non_constant_identifier_names

import 'dart:math';
//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:myprovider/model.dart';
import 'package:myprovider/provider/mapprovider.dart';
import 'package:myprovider/provider/myprovider.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Editpage extends StatefulWidget {

    Editpage({ required this.editindex, required this.edittitle, required this.editdescription});

  final int? editindex;
 final String? edittitle;
 final String? editdescription;
 

  @override
  _EditpageState createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {

  TextEditingController NameContorller = TextEditingController();
  TextEditingController DescriptionContorller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Title(color: Colors.red, child: Text("Good"))]),
      body: Column(
        children: [
          TextField(
            controller: NameContorller,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), label: Text("EditName")),
          ),
          TextField(
            controller: DescriptionContorller,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), label: Text("EditDescription")),
          ),
          ElevatedButton(
              onPressed: () {
               //    context.read<Mapprovider>().updateMap(updatedNote: NoteModel(title: NameContorller.text.toString(), desc: DescriptionContorller.text.toString()), index: my)
                /* context.read<Mapprovider>().addMap(
                                                                                           // both fuction is works same  only differce is yaha pe humko listen:false kerne ki need nahi hai   // ye 2 type ke hote hai  context.read() and context.watch()
                    NoteModel(
                        title: NameContorller.text.toString(),
                        desc: DescriptionContorller.text.toString()));*/

                //     Provider.of<Mapprovider>(context, listen: false).addMap(   // both fuction is works same  only differce is yaha pe humko listen:false kerne ki need  hai
                //         NoteModel(
                //             title: NameContorller.text.toString(),
                //             desc: DescriptionContorller.text.toString())
                //            );

                Navigator.pop(context);
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
