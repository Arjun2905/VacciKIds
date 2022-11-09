import 'package:flutter/material.dart';

class MyRegisterThree extends StatefulWidget {
  const MyRegisterThree({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}
class _MyRegisterState extends State<MyRegisterThree>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("VacciKids"),
          backgroundColor: Colors.grey,
          elevation: 0,
        ),
        body: Stack(
          children: [

            Container(
                child: Column(
                  children:[
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 30),
                      child: Text(
                        "Almost finished...",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blueGrey, fontSize: 33, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10, right:20),
                      child: Text(
                        "Your child's own personalized vaccination timeline will be created after this last step!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 20, top: 30, right:20),
                      // child: Text(
                      //   "Don't worry, you only have to do this once! ",
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(color: Colors.blueGrey, fontSize: 22, fontWeight: FontWeight.bold),
                      // ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:"Enter the details of their previous vaccinatiuons, which can be found in the vaccine booklet provided by the doctor",
                          style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                          children: const <TextSpan>[
                            TextSpan(text: "\n\nDon't worry, you only have to do this once!",
                              style: TextStyle(color: Colors.blueGrey, fontSize: 22, fontWeight: FontWeight.bold),
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
                                Navigator.pushNamed(context, 'details');
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                              )),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "No thanks, I'll do it later. \nShow me the official vaccination schedule.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff4c505b),
                                fontSize: 18),
                          ),
                          style: ButtonStyle(),
                        ),
                      ],
                    )
                  ]
                )
            ),

          ],
        ),
      ),
    );
  }
}
