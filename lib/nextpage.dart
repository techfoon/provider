import 'package:flutter/material.dart';
import 'package:myprovider/provider/myprovider.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({Key? key}) : super(key: key);

  @override
  _NextpageState createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Title(color: Colors.red, child: Text("Good"))]),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Provider.of<myprovider>(context ,listen: false).incrementCount();   ///Listen: False is used only where we get data inhere it is usless and taking memory.
          },
          label: Text("OK")),
    );
  }
}
