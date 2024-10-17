import 'package:flutter/material.dart';
import 'package:myprovider/editPage.dart';
import 'package:myprovider/model.dart';
import 'package:myprovider/nextpage.dart';
import 'package:myprovider/provider/mapprovider.dart';
import 'package:myprovider/provider/myprovider.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<NoteModel> alldata = [];

  @override
  Widget build(BuildContext context) {
    alldata.clear();
    log('Builder is Called');

    /// very important step
    var data = Provider.of<Mapprovider>(context).getMap();

    for (Map<String, dynamic> eachNote in data) {
      alldata.add(NoteModel.MaptoModel(eachNote));
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<myprovider>(
              builder: (_, Provider, __) {
                return Text(
                  '${Provider.getValue()}',

                  /// there is not differen they work ssames
                );
              },
            ),
            data.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Editpage(
                                        editindex: index,
                                        edittitle: alldata[index].title,
                                        editdescription: alldata[index].desc);
                                  }));
                                },
                                icon: Icon(Icons.edit)),
                            title: Text(alldata[index].title),
                            subtitle: Text(alldata[index].desc),
                            trailing: IconButton(
                                onPressed: () {
                                  context
                                      .read<Mapprovider>()
                                      .deleteMap(index: index);
                                },
                                icon: Icon(Icons.delete)),
                          );
                        }),
                  )
                : Text("List is Empty"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Nextpage();
                  }));
                },
                child: Text("NextPage"))
          ],
        ),
      ),
    );
  }
}
