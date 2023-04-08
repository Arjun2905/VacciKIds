import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vacci_kids/controller/validators.dart';
import 'package:vacci_kids/model/authentication/authentication_services.dart';
import 'package:vacci_kids/view/screens/home_screen.dart';
import 'package:vacci_kids/view/screens/login_screen.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => MyRegisterState();
}

class MyRegisterState extends State<MyRegister> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String email = "";
  String password = "";
  String confirmPassword = "";
  String name = "";
  List<String> childIds = [];

  Widget _signupUi() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Image.asset('assets/images/asset_3.png', width: 180),
        ),
        const SizedBox(
          height: 5,
        ),

        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Create Your Account',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ),

        const SizedBox(
          height: 22,
        ),

        TextFormField(
          controller: nameController,
          validator: (value) => Validator.validateName(name: value),
          style: const TextStyle(color: Colors.black),
          onSaved: (value){
            name = value!;
          },
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              hintText: "UserName",
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        TextFormField(
          controller: emailController,
          validator: (value) => Validator.validateEmail(email: value),
          style: const TextStyle(color: Colors.black),
          onSaved: (value){
            email = value!;
          },
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              hintText: "Email",
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        TextFormField(
          controller: passwordController,
          validator: (value)=>Validator.validatePassword(password: value),
          style: const TextStyle(color: Colors.black),
          obscureText: true,
          onSaved: (value){
            password = value!;
          },
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              hintText: "Password",
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        TextFormField(
          controller: confirmPasswordController,
          validator: (value)=>Validator.validateConfirmPassword(
              confirmPassword: value,
              password: passwordController.text),
          style: const TextStyle(color: Colors.black),
          obscureText: true,
          onSaved: (value){
            confirmPassword = value!;
          },
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              hintText: "Confirm Password",
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MyLogin()));
            },
            child: const Text(
              "Already have?",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(
                color: Colors.deepPurple,
              ),
            ),
          ),
            onPressed: () async {
              if (_key.currentState!.validate()) {
                User? user = await AuthenticationServices.signUpUsingEmail(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    childIds : childIds
                );
                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomeScreen(uid: user.uid,)));
                }
              }
            },
          child: const Text("Signup",style: TextStyle(fontSize: 20),),),

        const SizedBox(
          height: 10,
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
                    color: Colors.black,
                    height: 36,
                  )),
            ),
            const Text("OR"),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: const Divider(
                    color: Colors.black,
                    height: 36,
                  )),
            ),
          ]),
          Row(
            children: const <Widget>[Text(" ")],
          ),
        ]),

        const SizedBox(
          height: 10,
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
              child: _signupUi()),
        ),
      ),
    );
  }
}
