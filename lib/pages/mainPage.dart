import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:writers_owl/data/categories.dart';
import 'package:writers_owl/pages/startedmain.dart';
import 'package:writers_owl/widgets/maintext.dart';
import 'package:writers_owl/widgets/searchwidget.dart';

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

  List<Categories> categories = [
    Categories('Fantasy', 1),
    Categories('Reality', 2),
    Categories('Adventure', 3),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(
          child: Container(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('accountName'),
                  accountEmail: Text('accountEmail'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                  ),
                ),
                ListTile(
                  title: Text('Sign Out'),
                  leading: Icon(Icons.clear),
                  onTap: () async {
                    await _auth.signOut();
                    Future.delayed(Duration(milliseconds: 400), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartedPage()));
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
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/back15.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SearchWidget(),
                  MainText('Categories'),
                  Container(
                    child: TabBar(
                        controller: _controller,
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.greenAccent.shade100),
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.green,
                        tabs: [
                          Tab(
                            text: 'Fantasy',
                          ),
                          Tab(
                            text: 'Realty',
                          ),
                          Tab(
                            text: 'Adventure',
                          ),
                          //     Tab(text: 'Crime')
                          // ,Tab(text: 'Romance'),
                        ]),
                  ),
                  Container(
                    width: double.maxFinite,
                    color: Colors.grey.shade300,
                    height: 200,
                    child: TabBarView(controller: _controller, children: [
                      Text('fantasy'),
                      Text('reality'),
                      Text('adventure')
                    ]),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
