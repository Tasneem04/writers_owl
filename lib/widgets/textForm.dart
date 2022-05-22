import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  String text;
  TextInputType keybordType;
TextEditingController textController ;

  TextFieldForm(this.text, this.keybordType , this.textController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Material(
        elevation: 8,shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          keyboardType: keybordType,
          decoration: InputDecoration(contentPadding: EdgeInsets.all(16),
              hintText: text,
              filled: true,
              fillColor: Colors.white24,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none)),
       controller: textController,
        ),
      ),
    );
  }
}
