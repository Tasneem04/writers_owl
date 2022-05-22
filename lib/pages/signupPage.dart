import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:writers_owl/data/colors.dart';
import 'package:writers_owl/data/user.dart';
import 'package:writers_owl/pages/mainPage.dart';
import 'package:writers_owl/widgets/socialButton.dart';

import '../widgets/buttonCustom.dart';
import '../widgets/textForm.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late int groupValue;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confimPassController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  var isWriter = false;

  selectedGroupValue(int val) {
    setState(() {
      groupValue = val;
      if (val == 2) {
        isWriter = false;
      } else
        isWriter = true;
    });
  }

  @override
  void initState() {
    groupValue = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.blueGrey),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: ColorsMain.backgroundColor),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: ColorsMain.largMainTextColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 1, child: SocialButton('FaceBook')),
                      Expanded(flex: 1, child: SocialButton('Twitter'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                    child: Text(
                  'or sign up with email',
                  style: TextStyle(
                      color: ColorsMain.mainTextColor,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 20,
                ),
                TextFieldForm(' Name', TextInputType.text, nameController),
                TextFieldForm(
                    ' Your Email', TextInputType.emailAddress, emailController),
                TextFieldForm(
                    ' Password', TextInputType.text, passwordController),
                TextFieldForm('Confurm Password...', TextInputType.text,
                    confimPassController),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: groupValue,
                      onChanged: (int? value) {
                        setState(() {
                          selectedGroupValue(value!);
                        });
                      },
                    ),
                    Text('Writer'),
                    Radio(
                      value: 2,
                      groupValue: groupValue,
                      onChanged: (int? value) {
                        selectedGroupValue(value!);
                      },
                    ),
                    Text('Reader')
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton('Sign up', () {
                  signUp(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                      confimPassController.text,
                      isWriter);
                }),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    'By signing up , you agreed with our Terms of \n Services and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsMain.mainTextColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have account? ',
                        style: TextStyle(color: ColorsMain.mainTextColor),
                        children: [
                          TextSpan(
                              text: 'Log in',
                              style: TextStyle(
                                  color: ColorsMain.mainWidgetColor,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Future signUp(
      nameText, emailText, passwordText, confirmPassText, isWriter) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailText, password: passwordText)
          .then((value) =>
              {postDetailsToFireStore(nameText, emailText, isWriter)});
    } catch (e) {}
  }

  Future postDetailsToFireStore(nameText, emailText, isWriter) async {
    try {
      var _fireStore = FirebaseFirestore.instance;
      User? currentUser = _auth.currentUser;

      UserData newUser = UserData();
      newUser.nameUser = nameText;
      newUser.emailUser = emailText;
      newUser.isWriter = isWriter;
      newUser.idUser = currentUser?.uid;

      await _fireStore
          .collection('users')
          .doc(currentUser?.uid)
          .set(newUser.toMap());

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MainHomeReadingPage()));
    } catch (e) {}
  }
}
