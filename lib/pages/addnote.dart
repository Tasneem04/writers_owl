import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:writers_owl/data/colors.dart';
import 'package:writers_owl/widgets/textForm.dart';

import '../widgets/buttonCustom.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detialController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsMain.mainWidgetColor, size: 30),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/back12.jpg'),fit: BoxFit.cover)),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add Task  :',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFieldForm(
              'Title ',
              TextInputType.text,
              titleController,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Material(
                elevation: 8,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: 'main',
                      filled: true,
                      fillColor: Colors.white24,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none)),
                  controller: detialController,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomButton('Add Note', () {})
          ],
        ),
      ),
    );
  }
}
