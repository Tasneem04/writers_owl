import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:writers_owl/data/colors.dart';
import 'package:writers_owl/pages/loginPage.dart';
import 'package:writers_owl/pages/signupPage.dart';
import 'package:writers_owl/widgets/buttonCustom.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/back12.jpg'), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: ColorsMain.mainWidgetColor,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Owl',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Achive More ',
                    style: TextStyle(
                        color: ColorsMain.mainTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  CustomButton('Get Started', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  }),
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Already have an account ?',
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                              text: 'Log in',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
