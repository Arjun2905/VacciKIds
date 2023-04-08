import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:vacci_kids/model/User/child_user.dart';
import 'package:vacci_kids/model/fireStoreService.dart';
import 'package:vacci_kids/view/screens/home_screen.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({Key? key}) : super(key: key);

  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  String? gender;
  String? userid;

  Future<String?> addData() async {
    var collection = FirebaseFirestore.instance.collection('child_profiles');
    var docRef = await collection.add({
      'Name': nameController.text,
      'DOB' : dateController.text,
      'Gender' : gender,
      'Track' : "0"
    });
    userid = docRef.id;
    print("in add data function : " + userid.toString());
    return userid;
  }

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var userid = await addData();
      User? parentUser = FirebaseAuth.instance.currentUser;
      var document = await FirebaseFirestore.instance.collection('parent_profiles').doc(parentUser?.uid).get();
      print("Child user : " + userid.toString());
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      List<dynamic> list = [];
      // int count = data['childCount'] as int;
      // count = count + 1;
      if(data['childIds']!=null){
        list = data['childIds'];
      }
      list.add(userid);
      await FirebaseFirestore.instance.collection('parent_profiles').doc(parentUser?.uid).update({'childIds' : list});
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
              children: [
                Image.asset("assets/images/child_img.png", fit: BoxFit.cover),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Generate Child Profile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.child_care_sharp),
                          hintText: "Enter name",
                          labelText: "Name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today_rounded),
                          hintText: "Enter date of birth",
                          labelText: "Date of birth",
                        ),
                        onTap: () async {
                          DateTime? pickDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime.now());

                          if (pickDate != null) {
                            setState(() {
                              dateController.text =
                                  DateFormat('dd-MM-yyyy').format(pickDate);
                            });
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please select date of birth";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      // SizedBox(
                      //   height: 40.0,
                      // ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: DropdownButtonFormField2(
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                      prefixIcon: Align(
                        widthFactor: 2.0,
                        heightFactor: 2.0,
                        child: Icon(
                          Icons.person,
                          size: 25,
                        ),),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Your Gender',
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      // color: Colors.black45,
                    ),
                    buttonHeight: 60,
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      gender = value as String?;
                      print(gender);
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(minimumSize: const Size(150, 40)),
                  onPressed: () {
                    moveToHome(context);
                  },
                  child: const Text('Next'),
                )
              ]),
        ),
      ),
    );
  }
}