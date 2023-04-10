import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vacci_kids/view/widgets/vaccine_cards.dart';
import 'package:vacci_kids/view/screens/parent_profile.dart';

class VaccineScheduleScreen extends StatefulWidget{
  const VaccineScheduleScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyVaccineScheduleScreen();
}

class MyVaccineScheduleScreen extends State<VaccineScheduleScreen>{
  int _selectedIndex = 0;
  final database = FirebaseFirestore.instance.collection('vaccines');

  Widget buildNavigationBar() {
    return GNav(
      backgroundColor: Colors.white70,
      padding: const EdgeInsets.all(18),
      tabMargin: const EdgeInsets.fromLTRB(5, 0, 2, 5),
      gap: 5,
      tabs: const [
        GButton(
          icon: Icons.home_outlined,
          text: "Home",
          active: true,
          curve: Curves.easeOut,
          iconColor: Colors.black,
          iconActiveColor: Colors.indigo,
        ),
        GButton(
          icon: Icons.account_circle_outlined,
          text: "Profile",
          curve: Curves.easeOut,
          iconColor: Colors.black,
          iconActiveColor: Colors.indigo,
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

  Widget futureWidgets() {
    return StreamBuilder<QuerySnapshot>(
        stream: database.snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  snapshot.data!.docs[index];
                  return VaccineCard(
                      name: documentSnapshot['name'],
                      info: documentSnapshot['info'],
                      vacc_for: documentSnapshot['usedFor'],
                      duration: documentSnapshot['duration'],
                      dose: documentSnapshot['dose'],
                      sr: documentSnapshot['sr']);
                }
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavigationBar(),
      body: (_selectedIndex==0)?futureWidgets():const ParentProfile(),
    );
  }
}