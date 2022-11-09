import 'package:flutter/material.dart';

class MyRegisterTwo extends StatefulWidget {
  const MyRegisterTwo({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegisterTwo> {
  bool isChecked = false;
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
              //   "Create Your Child's Profile",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(color: Colors.blueGrey, fontSize: 22, fontWeight: FontWeight.bold),
              // ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:"Create Your Child's Profile",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22, fontWeight: FontWeight.bold),
                    children: const <TextSpan>[
                      TextSpan(text:"\nIf you have more children, you'll be able to add them later.",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
            ),
            // Container(
            //   padding: EdgeInsets.only(left: 35, top: 30),
            //   child: Text(
            //     "If you have more children, you'll be able to add them later.",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(color: Colors.blueGrey, fontSize: 22),
            //   ),
            // ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
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
                                hintText: "Child Name",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "My child is a:",
                          //     )
                          //   ],
                          // ),
                          Container(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "The name you use for this profile can be any name you like. (You don't have to use your child's real name if you don't want to.)",
                              style: TextStyle(color: Colors.blueGrey, fontSize: 10),
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
                                hintText: "Date of Birth (DD/MM/YY)",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Container(
                          //   child: Text(
                          //     'At GlaxoSmithKline and its affiliated entities (“GSK” or “We”, spread across many jurisdictions), we value your privacy and care about the way in which your personal information is treated.\n\nAs part of making the service available and useful GSK may collect some personal information related to you/your child, to receive and have access to your childs’ personalised vaccination calender as the account user of MyVaccinationHub records.\n\nGSK and its trusted third-party suppliers (which may be outside your home country), may collect and process some personal information related to you and your child/children for the purposes of:\n* making the MyVaccinationHub reminder service available and useful to you and\n* for you to receive and access your child/children’s personalized vaccination calendar\n\nPersonal Information (PI) collected includes:\n* PI about you, which includes (Name and Email id,phone number)\n* Your child’s/children’s PI which includes (Name, Date of birth, Vaccination history)\n\nWe will implement appropriate measures to ensure that the personal information about you and your children remains protected, especially when it is transferred outside of your home country, in accordance with applicable data protection and Privacy laws. Please review the full privacy notice to find out how we use your personal information and your rights in relation to that information.',
                          //     textAlign: TextAlign.justify,
                          //     style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                          //   ),
                          // ),
                          // Container(
                          //     padding: EdgeInsets.only(left: 35, top: 30),
                          //     child: RichText(
                          //       text: TextSpan(
                          //         text:"PI processing:",
                          //           style: TextStyle(color: Colors.blueGrey, fontSize: 33, fontWeight: FontWeight.bold),
                          //         children: const <TextSpan>[
                          //           TextSpan(text: 'In line with the above Notice and for the purpose quoted above, pls share your explicit consent by selecting the checkbox:',
                          //             style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                          //           ),
                          //         ],
                          //       ),
                          //     )
                          // ),
                          // Container(
                          //   child: Card(
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(15.0),
                          //       child: SizedBox(
                          //         width: 430,
                          //         height: 700,
                          //         child: Column(
                          //           children: [
                          //             Text(
                          //               'PI processing:',
                          //               style: TextStyle(color: Colors.blueGrey, fontSize: 22, fontWeight: FontWeight.bold),//TextStyle
                          //             ), //Text
                          //             SizedBox(height: 10),
                          //             Row(
                          //               children: <Widget>[
                          //                 SizedBox(
                          //                   width: 10,
                          //                 ), //SizedBox
                          //                 Text(
                          //                   "I consent for GSK and its trusted third parties to process My child/children’s and my personal information (PI) , only for the purposed quoted above. I understand that this may include processing of PI outside my home country, with appropriate measures implemented to protect my data.",
                          //                  textAlign: TextAlign.left,
                          //                   style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                          //                 ), //Text
                          //                 SizedBox(width: 10), //SizedBox
                          //                 Checkbox(
                          //                   checkColor: Colors.white,
                          //                   value: isChecked,
                          //                   onChanged: (bool? value) {
                          //                     setState(() {
                          //                       isChecked = value!;
                          //                     });
                          //                   },
                          //                 ), //Checkbox
                          //               ], //<Widget>[]
                          //             ),
                          //             SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               "You have the right to withdraw your consent for the purposes set out above, at any time.\n* you can also withdraw your consent, to using your child/children’s personal information, by clicking the “‘remove child’ button from the portal, and\n* Manage your preference to receive contextualized reminders by SMS or email, by using the available mechanisms to opt-out.",
                          //                 style: TextStyle(color: Colors.blueGrey, fontSize: 14)
                          //             )//Row
                          //           ],
                          //         ), //Column
                          //       ), //SizedBox
                          //     ), //Padding
                          //   ), //Card
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'register3');
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),

                          // SizedBox(
                          //   height: 40,
                          // ),
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