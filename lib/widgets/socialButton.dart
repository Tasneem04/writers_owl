import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String textName;
  final Color buttonColor;

  SocialButton(this.textName, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(buttonColor),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        onPressed: () {},
        child: Text(textName),
      ),
    );
  }
}
