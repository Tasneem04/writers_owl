import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:writers_owl/pages/startedmain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const
    MaterialApp(
      home: StartedPage(),
    );
  }
}

