import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  late String _textMain;

  MainText(this._textMain);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        _textMain,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
