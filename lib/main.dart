import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vacci_kids/view/screens/login_screen.dart';
import 'package:vacci_kids/view/screens/home_screen.dart';
import 'model/notification/notificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  VacciKids createState() => VacciKids();
}

class VacciKids extends State<MyApp>{
  late StreamSubscription<User?> user;

  @override
  void initState() {
    NotificationService().initialize();
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print("user is currently signed out");
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _getNextScreen(),
    );
  }

  Widget _getNextScreen() {
    if (FirebaseAuth.instance.currentUser == null) {
      return const MyLogin();
    }
    return const MyLogin();
  }
}