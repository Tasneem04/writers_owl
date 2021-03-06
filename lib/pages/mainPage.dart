import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:writers_owl/data/categories.dart';
import 'package:writers_owl/data/colors.dart';
import 'package:writers_owl/pages/addnote.dart';
import 'package:writers_owl/pages/startedmain.dart';

class MainHomeReadingPage extends StatefulWidget {
  const MainHomeReadingPage({Key? key}) : super(key: key);

  @override
  State<MainHomeReadingPage> createState() => _MainHomeReadingPageState();
}

class _MainHomeReadingPageState extends State<MainHomeReadingPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late FirebaseAuth _auth = FirebaseAuth.instance;
  late FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var firbaseUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 3, vsync: this);

    // getValue();
  }

  // Future getDocs() async {
  //   QuerySnapshot querySnapshot = await Firestore.instance.collection("collection").getDocuments();
  //   for (int i = 0; i < querySnapshot.documents.length; i++) {
  //     var a = querySnapshot.documents[i];
  //     print(a.documentID);
  //   }
  // }

  // Future getValue() async {
  //   var leanth;
  //   leanth = catogriesRef.doc(firbaseUser?.uid).get();
  //   await leanth;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsMain.mainWidgetColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              UserAccountsDrawerHeader(decoration: BoxDecoration(color: ColorsMain.mainWidgetColor),
                accountName: Text('accountName'),
                accountEmail: Text('accountEmail'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.clear),
                onTap: () async {
                  await _auth.signOut();
                  Future.delayed(Duration(milliseconds: 400), () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StartedPage()));
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/back12.jpg'), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Plan Your Day :',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  child: Text('Add Task',
                      style: TextStyle(
                          color: ColorsMain.mainWidgetColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNotePage()));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
