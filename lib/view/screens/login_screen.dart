import 'package:vacci_kids/view/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vacci_kids/model/authentication/authentication_services.dart';
import 'package:vacci_kids/view/screens/home_screen.dart';
import 'package:vacci_kids/controller/validators.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => MyLoginState();
}

class MyLoginState extends State<MyLogin> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();
  String email = "";
  String password = "";

  Widget _loginUi() {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/asset_3.png',
          width: 200,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            'VacciKids',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.blueGrey,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Signin to your account',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        TextFormField(
          controller: emailController,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onSaved: (value) {
            email = value!;
          },
          validator: (value)=>Validator.validateEmail(email: value),
        ),
        const SizedBox(
          height:18,
        ),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onSaved: (value) {
            email = value!;
          },
          validator: (value)=>Validator.validatePassword(password: value),
        ),
        const SizedBox(
          height: 18,
        ),
        ElevatedButton(
          onPressed: () async {
            if (_key.currentState!.validate()) {
              User? user = await AuthenticationServices.signInUsingEmail(
              email: emailController.text,
              password: passwordController.text);
              if (user != null) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(uid: user.uid)));
              }
            }},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(
                  color: Colors.deepPurple,
            ),
          ),),
          child: const Text(
            "Signin",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          children: <Widget>[
            TextButton(
              child: const Text(
                'Sign up',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    color:  Colors.blueGrey,
                )
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyRegister()));
              },
            ),
            const Spacer(),
            TextButton(
              child: const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
              onPressed: () {
                //signup screen
                forgotSection();
                print("Text : " + textEditingController.text);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(children: <Widget>[
          Row(
            children: const <Widget>[Text(" ")],
          ),
          Row(children: <Widget>[
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: const Divider(
                    color:Colors.black,
                    height: 36,
                  )),
            ),
            const Text("OR"),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: const Divider(
                    color:Colors.black,
                    height: 36,
                  )),
            ),
          ]),
          Row(
            children: const <Widget>[Text(" ")],
          ),
        ]),
        const SizedBox(
          height: 3,
        ),
        InkWell(
          onTap: () async {
            await AuthenticationServices.signInWithGoogle();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(uid: FirebaseAuth.instance.currentUser!.uid,)));
          },
          child: Ink(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset('assets/images/googleIcon.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future forgotSection() {
    return showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Email"),
            actionsAlignment: MainAxisAlignment.end,
            content: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email_outlined),
                          labelText: "Email",
                          hintText: "abc@gmail.com",
                      ),
                      controller: textEditingController,
                    ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Email sent..."),
                      ));
                      AuthenticationServices.resetPassword(
                          textEditingController.text);
                    });
                  },
                  child: const Text("Send Email"))
            ],
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
              key: _key,
              autovalidateMode: AutovalidateMode.disabled,
              child: _loginUi()),
        ),
      ),
    );
  }
}
