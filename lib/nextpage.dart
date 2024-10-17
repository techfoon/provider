import 'dart:math';
//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:myprovider/model.dart';
import 'package:myprovider/provider/mapprovider.dart';
import 'package:myprovider/provider/myprovider.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({Key? key}) : super(key: key);

  @override
  _NextpageState createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
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
                border: UnderlineInputBorder(), label: Text("Name")),
          ),
          TextField(
            controller: DescriptionContorller,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), label: Text("Description")),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<Mapprovider>().addMap(
                    // both fuction is works same  only differce is yaha pe humko listen:false kerne ki need nahi hai   // ye 2 type ke hote hai  context.read() and context.watch()
                    NoteModel(
                        title: NameContorller.text.toString(),
                        desc: DescriptionContorller.text.toString()));

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
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Provider.of<myprovider>(context, listen: false).incrementCount();

         //   Navigator.pop(context);
          },
          label: Text("Increment")),
    );
  }
}
