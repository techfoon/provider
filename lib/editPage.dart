import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myprovider/model.dart';
import 'package:myprovider/provider/mapprovider.dart';

class Editpage extends StatefulWidget {
  final int editindex;
  final String edittitle;
  final String editdescription;

  Editpage({required this.editindex, required this.edittitle, required this.editdescription});

  @override
  _EditpageState createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    // Initialize the TextEditingController with the values passed from the previous screen
    nameController = TextEditingController(text: widget.edittitle);
    descriptionController = TextEditingController(text: widget.editdescription);
  }

  @override
  void dispose() {
    // Dispose the controllers to free up memory
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Edit Name",
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Edit Description",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the note in the provider
                context.read<Mapprovider>().updateMap(
                  updatedNote: NoteModel(
                    title: nameController.text,
                    desc: descriptionController.text,
                  ),
                  index: widget.editindex,
                );

                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
