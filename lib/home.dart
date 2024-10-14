import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> data = [];

  @override
  Widget build(BuildContext context) {
    data = Provider.of<Mapprovider>(context).getMap();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${Provider.of<myprovider>(context).getValue()}',
            ),
            data.isNotEmpty
                ? Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                  
                          title:Text(data[index]['title']),
                          subtitle:Text(data[index]['description']) ,
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
