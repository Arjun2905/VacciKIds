import 'package:flutter/material.dart';
import 'package:helloworld/Step.dart';

class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
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
      steps: <Step>[
        getStep(dose: 3, name: "DPT", period: "4 JAN", total: 5),
        getStep(dose: 4, name: "Vaxchora", period: "12 JAN", total: 5),
        getStep(dose: 1, name: "HEPb", period: "14 JAN", total: 5),
        getStep(dose: 2, name: "HEPa", period: "7 JAN", total: 5),
        getStep(dose: 1, name: "DTaP", period: "31 JAN", total: 5),
        getStep(dose: 1, name: "Covaxin", period: "26 JAN", total: 5),
        getStep(dose: 3, name: "HPV", period: "27 JAN", total: 5),
        getStep(dose: 4, name: "RST", period: "28 JAN", total: 5),
        getStep(dose: 2, name: "Fluarix", period: "29 JAN", total: 5),
        getStep(dose: 2, name: "DPTMMRV", period: "9 JAN", total: 5),
        getStep(dose: 6, name: "Vaccinia", period: "11 JAN", total: 7),
        getStep(
            dose: 1,
            name: "Typhoid Polysaccharide",
            period: "14 JAN",
            total: 5),
        getStep(dose: 2, name: "Varivax", period: "10 JAN", total: 5),
        getStep(dose: 1, name: "YF", period: "11 JAN", total: 5),
        getStep(dose: 3, name: "DPT", period: "13 JAN", total: 5),
      ],
    );
  }
}
