import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:writers_owl/data/colors.dart';
import 'package:writers_owl/pages/mainPage.dart';
import 'package:writers_owl/widgets/buttonCustom.dart';
import 'package:writers_owl/widgets/textForm.dart';

import '../widgets/maintext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorsMain.mainWidgetColor,size: 30),
      ),
      body: Container(decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/back12.jpg'))),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            MainText('Log In'),
            TextFieldForm('Email', TextInputType.emailAddress, emailController),
            TextFieldForm('Password', TextInputType.text, passwordController),
            SizedBox(
              height: 20,
            ),
            CustomButton('Log in', () {
              login('test6@gmail.com', 'test678');
            })
          ],
        ),
      ),
    );
  }

  Future login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainHomeReadingPage())));
    } catch (e) {
      print(' no sign in');
    }
  }
}
