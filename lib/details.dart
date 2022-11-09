import 'package:flutter/material.dart';
class MyDetails extends StatefulWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("VacciKids",
          style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(),
            Container(
              decoration: new BoxDecoration(
                color: Colors.grey,
                boxShadow:[new BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0,
                ),]
              ),
              child: Text(
                  "Please fill below vaccination records to proceed further",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            Container(
              padding: EdgeInsets.only(left: 10, top: 30, right:10),
              child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:"Add Vaccination Records",
                          style: TextStyle(color: Colors.blueGrey, fontSize: 22, fontWeight: FontWeight.bold),
                        children: const <TextSpan>[
                          TextSpan(text: "\nFind the corresponding vaccines from your child's vaccination booklet and enter the dates they were received below.",
                            style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                          ),
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