import 'package:flutter/material.dart';
import 'package:vaccikids/main.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          Icons.account_box_sharp,
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
                          Icons.location_city_sharp,
                        ),
                        title: Text(
                          'City',
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
                    Navigator.pushNamed(context, MyRoutes.childRoute);
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
