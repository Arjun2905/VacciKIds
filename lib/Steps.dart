import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Step.dart';


class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

// async function to get the data from the database
Future<List<Step>> getSteps() async {
  // get the data from the database
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('vaccines')
      .orderBy('sr')
      .get();

  print(querySnapshot.docs);
  // create a list of steps
  List<Step> steps = [];
  // loop through the data and add it to the list
  for (var doc in querySnapshot.docs) {
    steps.add(getStep(
        name: doc['name'],
        period: doc['period'],
        dose: doc['dose'],
        total: doc['total']));
  }
  // return the list
  return steps;
}

class _StepsState extends State<Steps>  {
  
  // fetch data from firestore
  // create a list of Step objects
 
  int _index = 0;

  @override
  Widget build(BuildContext context)   {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      // use getSteps() to get the list of steps 
      steps:  <Step>[
        getStep(dose: 3, name: "DPT", period: "4 JAN", total: 5),
        getStep(dose: 4, name: "Vaxchora", period: "12 JAN", total: 5),
        getStep(dose: 1, name: "HEPb", period: "14 JAN", total: 5),
        getStep(dose: 2, name: "HEPa", period: "7 JAN", total: 5),
        getStep(dose: 1, name: "DTaP", period: "31 JAN", total: 5)
      ]
    );
  }
}
