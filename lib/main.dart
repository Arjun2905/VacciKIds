import 'package:flutter/material.dart';
import 'package:loginsignup/login.dart';
import 'package:loginsignup/register.dart';
import 'package:loginsignup/register2.dart';
import 'package:loginsignup/register3.dart';
import 'package:loginsignup/details.dart';

void main() {
  runApp(MaterialApp(
    // debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'details': (context) => MyDetails(),
      'register3': (context) => MyRegisterThree(),
      'register2': (context) => MyRegisterTwo(),
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}