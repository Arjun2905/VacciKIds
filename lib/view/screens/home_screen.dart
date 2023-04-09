import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vacci_kids/model/fireStoreService.dart';
import 'package:vacci_kids/view/widgets/child_cards.dart';
import 'package:vacci_kids/view/screens/parent_profile.dart';
import 'package:vacci_kids/view/screens/child_register.dart';

class HomeScreen extends StatefulWidget{
  final String uid;
  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyHomeScreen();
}

class MyHomeScreen extends State<HomeScreen>{
  Map<String, dynamic> data = {};
  late List<String> childIds;
  int _selectedIndex = 0;

  Future<void> getUserData(String uid) async {
    var document = await FirebaseFirestore.instance.collection('parent_profiles').doc(uid).get();
    // setState(() {
      print('Inside set-state');
      data = document.data()!;
      print(data);
    // });
  }

  Widget getParticularSection(int index){
    getUserData(widget.uid);
    print('Info of Data : ' + data.toString());
    if(index==0){
      print(data['id']);
      return bodySection();
    }else{
      return const ParentProfile();
    }
  }

  Widget bodySection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
      child: Column(),
    );
  }

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
              getParticularSection(_selectedIndex);
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
              getParticularSection(_selectedIndex);
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
      body: getParticularSection(_selectedIndex),
    );
  }
}