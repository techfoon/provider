import 'package:flutter/material.dart';
import 'package:myprovider/model.dart';
import 'package:myprovider/nextpage.dart';
import 'package:myprovider/provider/mapprovider.dart';
import 'package:myprovider/provider/myprovider.dart';
import 'package:provider/provider.dart';

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
    alldata.clear();  /// very important step
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
            Text(
              '${Provider.of<myprovider>(context).getValue()} ok ${context.watch<myprovider>().getValue()}', /// there is not differen they work ssames
            ),
            data.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            title: Text(alldata[index].title),
                            subtitle: Text(alldata[index].desc),
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
