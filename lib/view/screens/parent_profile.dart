import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vacci_kids/view/screens/login_screen.dart';

class ParentProfile extends StatefulWidget {
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
              padding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('parent_profiles')
                    .doc(uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    var parentData =
                    snapshot.data!.data() as Map<String, dynamic>?;
                    if (parentData != null) {
                      var parentName = parentData['name'];
                      var parentEmail = parentData['email'];
                      var totalChildren = parentData['childCount'];
                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              leading: const Icon(
                                Icons.badge_sharp,
                              ),
                              title: Text("Name: $parentName"),
                            ),
                            elevation: 6,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          Card(
                            child: ListTile(
                              leading: const Icon(
                                Icons.account_box_sharp,
                              ),
                              title: Text("Email: $parentEmail"),
                            ),
                            elevation: 6,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          Card(
                            child: ListTile(
                              leading: const Icon(
                                Icons.location_city_sharp,
                              ),
                              title: Text("Total Children: $totalChildren"),
                            ),
                            elevation: 6,
                            margin: const EdgeInsets.symmetric(vertical: 10),
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
                                FirebaseAuth.instance.signOut();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>const MyLogin()
                                    )
                                );
                              },
                            child: const Text(
                              "Logout",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Text('No data found');
                    }
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
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