import 'package:flutter/material.dart';
import 'package:vaccikids/main.dart';

class ChildProfile extends StatefulWidget {
  const ChildProfile({super.key});

  @override
  State<ChildProfile> createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/girl_img.png", fit: BoxFit.cover),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Child Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: const [
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.badge_sharp,
                        ),
                        title: Text('ID'),
                      ),
                      elevation: 6,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.child_care_sharp,
                        ),
                        title: Text(
                          'Name',
                        ),
                      ),
                      elevation: 6,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.date_range_sharp,
                        ),
                        title: Text(
                          'Date of Birth',
                        ),
                      ),
                      elevation: 6,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.person_sharp,
                        ),
                        title: Text(
                          'Gender',
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.parentRoute);
                  },
                  style: TextButton.styleFrom(minimumSize: const Size(150, 40)),
                  child: const Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
