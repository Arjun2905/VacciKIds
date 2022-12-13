import 'package:flutter/material.dart';
import 'package:vacci_kids/model/fireStoreService.dart';
import 'package:vacci_kids/model/User/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ParentProfile extends StatefulWidget{
  const ParentProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyParentProfile();
}

class MyParentProfile extends State<ParentProfile> {
  var uid = FirebaseAuth.instance.currentUser?.uid;
    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/parent_img.png", fit: BoxFit.cover),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Parent Profile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 32),
                  child: Column(
                    children: const [
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.badge_sharp,
                          ),
                          title: Text('Anuj Jain'),
                        ),
                        elevation: 6,
                        margin: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.account_box_sharp,
                          ),
                          title: Text(
                            "Jaipur",
                          ),
                        ),
                        elevation: 6,
                        margin: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.location_city_sharp,
                          ),

                          title: Text(
                            "Total Children : 1",
                          ),
                        ),
                        elevation: 6,
                        margin: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
      );
    }
  }