import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vacci_kids/model/fireStoreService.dart';
import 'package:vacci_kids/view/widgets/child_cards.dart';
import 'package:vacci_kids/view/screens/parent_profile.dart';
import 'package:vacci_kids/view/screens/child_register.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyHomeScreen();
}

class MyHomeScreen extends State<HomeScreen>{
  int _selectedIndex = 0;
  static User? myUser = FirebaseAuth.instance.currentUser;
  static String? uid = myUser?.uid;
  Future<Object> data = FireStoreServices().getParentUser(uid);
  Widget bodySection = SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: const [
        ChildCard(name : 'Jay', age: 1),
      ],
    ),
  );

  Widget buildNavigationBar() {
    return GNav(
      backgroundColor: Colors.white70,
      padding: const EdgeInsets.all(18),
      tabMargin: const EdgeInsets.fromLTRB(5, 0, 2, 5),
      gap: 5,
      tabs: [
        GButton(
          icon: Icons.home_outlined,
          text: "Home",
          active: true,
          curve: Curves.easeOut,
          iconColor: Colors.black,
          iconActiveColor: Colors.indigo,
          onPressed: (){
            setState(() {
              bodySection = SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    ChildCard(name : 'Jay', age: 1),
                  ],
                ),
              );
            });
          },
        ),
        GButton(
          icon: Icons.account_circle_outlined,
          text: "Profile",
          curve: Curves.easeOut,
          iconColor: Colors.black,
          iconActiveColor: Colors.indigo,
          onPressed: (){
            setState(() {
              bodySection = const ParentProfile();
            });
          },
        )
      ],
      activeColor: Colors.indigoAccent,
      selectedIndex: _selectedIndex,
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
          print(_selectedIndex);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChildPage()));
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: buildNavigationBar(),
      body: bodySection,
    );
  }
}