import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccikids/pages/child_page.dart';
import 'package:vaccikids/pages/child_profile.dart';
import 'package:vaccikids/pages/parent_page.dart';

void main() {
  runApp(Profile());
}

class MyRoutes {
  static String parentRoute = "/login";
  static String childRoute = "/home";
  static String childProfileRoute = "/profile";
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: "/",
      routes: {
        "/" :(context) => ParentPage(),
        MyRoutes.parentRoute :(context) => ParentPage(),
        MyRoutes.childRoute :(context) => ChildPage(),
        MyRoutes.childProfileRoute :(context) => ChildProfile(),
      },
    );
  }
}


