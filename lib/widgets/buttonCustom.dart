import 'package:flutter/material.dart';
import 'package:writers_owl/data/colors.dart';

class CustomButton extends StatelessWidget {

  final String textName;
late Function() _onFunctionTap;

  CustomButton(this.textName, this._onFunctionTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorsMain.mainWidgetColor),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
              onPressed: _onFunctionTap,
              child: Text(
                textName,
                style: TextStyle(fontSize: 17),
              ))),
    );
  }
}
