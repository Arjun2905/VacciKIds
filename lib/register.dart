import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text("VacciKids"),
          backgroundColor: Colors.grey,
          elevation: 0,
        ),
        body: Stack(
          children: [

            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              // child: Text(
              //   'Create Your Account',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(color: Colors.blueGrey, fontSize: 33, fontWeight: FontWeight.bold),
              // ),
              child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:"Create Your Account",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 33, fontWeight: FontWeight.bold),
                      children: const <TextSpan>[
                        TextSpan(text:"\nLets Start with few basics.",
                          style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                        ),
                      ],
                    ),
              )
            ),
            SizedBox(
              height: 30,
            ),
            // Container(
            //   padding: EdgeInsets.only(left: 35, top: 30),
            //   child: Text(
            //     'Lets Start with few basics.',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(color: Colors.blueGrey, fontSize: 22),
            //   ),
            // ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "UserName",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Your user name can be any name you like. (You don't have to use your real name if you don't want to.)",
                              style: TextStyle(color: Colors.blueGrey, fontSize: 8),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Passwords must have at least 7 characters, and each of the following: lower case, upper case, numeric (0-9), special character e.g. @, ?, *",
                              style: TextStyle(color: Colors.blueGrey, fontSize: 8),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, top: 30, right:10),
                            // child: Text(
                            //   "GSK and its trusted third-party suppliers (which may be outside your home country) may collect and process some personal information related to you as the account user of MyVaccinationHub records.\n\nPlease review the full Privacy Notice to find out how we use your personal information and your rights in relation to that information.You can withdraw consent to the use of your personal information for the purposes set out above, at any time.",
                            //   textAlign: TextAlign.justify,
                            //   style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                            // ),
                            child:RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text:"GSK and its trusted third-party suppliers (which may be outside your home country) may collect and process some personal information related to you as the account user of ",
                                style: TextStyle(color: Colors.blueGrey, fontSize:14),
                                children: const <TextSpan>[
                                  TextSpan(text: "MyVaccinationHub records.",
                                    style: TextStyle(color: Colors.blueGrey, fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: "\n\nPlease review the full Privacy Notice to find out how we use your personal information and your rights in relation to that information.You can withdraw consent to the use of your personal information for the purposes set out above, at any time.",
                                    style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   'Next',
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 27,
                              //       fontWeight: FontWeight.w700),
                              // ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'register2');
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}