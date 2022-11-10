import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vacci_kids/view/widgets/child_cards.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyHomeScreen();
}

class MyHomeScreen extends State<HomeScreen>{
  int _selectedIndex = 0;


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: buildNavigationBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: const [
            ChildCard(name: 'Arjun', age: 21),
            ChildCard(name : 'Kalash', age: 20),
          ],
        ),
      ),
    );
  }
}