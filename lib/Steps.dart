import 'package:flutter/material.dart';
import 'package:helloworld/Step.dart';
import 'package:helloworld/vaccine_info.dart';

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
        // Navigator.push(context, VaccineInfo )
      },
      steps: <Step>[
        getStep(dose: 1, name: 'BCG', period: 'Nov 10 2022', total: 1),
        getStep(dose: 1, name: 'HEP B', period: 'Nov 10 2022', total: 4),
        getStep(dose: 1, name: 'OPV', period: 'Nov 10 2022', total: 1),
        getStep(dose: 1, name: 'DTwP, DTaP', period: 'Dec 10 2022', total: 3),
        getStep(dose: 2, name: 'HEP B', period: 'Dec 10 2022', total: 4),
        getStep(dose: 1, name: 'HIB', period: 'Dec 10 2022', total: 4),
        getStep(dose: 1, name: 'IPV', period: 'Dec 10 2022', total: 5),
        getStep(dose: 1, name: 'PCV', period: 'Dec 10 2022', total: 4),
        getStep(dose: 1, name: 'Rotavirus', period: 'Dec 10 2022', total: 3),
        getStep(dose: 2, name: 'DTwP, DTaP', period: 'Jan 10 2023', total: 3),
        getStep(dose: 3, name: 'HEP B', period: 'Jan 10 2023', total: 4),
        getStep(dose: 2, name: 'HIB', period: 'Jan 10 2023', total: 4),
        getStep(dose: 2, name: 'IPV', period: 'Jan 10 2023', total: 5),
        getStep(dose: 2, name: 'PCV', period: 'Jan 10 2023', total: 4),
        getStep(dose: 2, name: 'Rotavirus', period: 'Jan 10 2023', total: 3),
        getStep(dose: 3, name: 'DTwP, DTaP', period: 'Feb 10 2023', total: 3),
        getStep(dose: 4, name: 'HEP B', period: 'Feb 10 2023', total: 4),
        getStep(dose: 3, name: 'HIB', period: 'Feb 10 2023', total: 4),
        getStep(dose: 3, name: 'IPV', period: 'Feb 10 2023', total: 5),
        getStep(dose: 3, name: 'PCV', period: 'Feb 10 2023', total: 4),
        getStep(dose: 3, name: 'Rotavirus', period: 'Feb 10 2023', total: 3),
        getStep(dose: 1, name: 'Influenza', period: 'May 10 2023', total: 2),
        getStep(dose: 1, name: 'TCV', period: 'May 10 2023', total: 1),
        getStep(dose: 2, name: 'Influenza', period: 'May 10 2023', total: 2),
        getStep(dose: 1, name: 'MenACWY', period: 'Aug 10 2023', total: 2),
        getStep(dose: 1, name: 'MMR', period: 'Aug 10 2023', total: 3),
        getStep(dose: 1, name: 'Yellow Fever', period: 'Aug 10 2023', total: 1),
        getStep(dose: 1, name: 'Cholera', period: 'Nov 10 2023', total: 2),
        getStep(dose: 1, name: 'Hepatitis A', period: 'Nov 10 2023', total: 2),
        getStep(
            dose: 1,
            name: 'Japanese Encephelitis',
            period: 'Nov 10 2023',
            total: 2),
        getStep(dose: 2, name: 'MenACWY', period: 'Nov 10 2023', total: 2),
        getStep(dose: 2, name: 'Cholera', period: 'Dec 10 2023', total: 2),
        getStep(
            dose: 2,
            name: 'Japanese Encephelitis',
            period: 'Dec 10 2023',
            total: 2),
        getStep(dose: 2, name: 'MMR', period: 'Feb 10 2024', total: 3),
        getStep(dose: 1, name: 'Varicella', period: 'Feb 10 2024', total: 2),
        getStep(
            dose: 1,
            name: 'DTP Booster',
            period: '10/2024 - 10/2024',
            total: 2),
        getStep(dose: 4, name: 'HIB', period: '10/2024 - 10/2024', total: 4),
        getStep(dose: 4, name: 'IPV', period: '10/2024 - 10/2024', total: 5),
        getStep(dose: 4, name: 'PCV', period: '10/2024 - 10/2024', total: 4),
        getStep(dose: 2, name: 'Hepatitis A', period: 'May 10 2024', total: 2),
// getStep(dose: annual(1, name: 'Influenza', period: '10/2024 - 10/2024', total: 1)),
        getStep(
            dose: 2, name: 'Varicella', period: '10/2024 - 10/2024', total: 2),
// getStep(dose: annual(1, name: 'Influenza', period: 'Nov 10 2025', total: 1)),
// getStep(dose: annual(1, name: 'Influenza', period: 'Nov 10 2026', total: 1)),
        getStep(
            dose: 2,
            name: 'DTP Booster',
            period: '10/2026 - 10/2028',
            total: 2),
        getStep(dose: 5, name: 'IPV', period: '10/2026 - 10/2028', total: 5),
        getStep(dose: 3, name: 'MMR', period: '10/2026 - 10/2028', total: 3),
// getStep(dose: annual(1, name: 'Influenza', period: 'Nov 10 2027', total: 1)),
        getStep(
            dose: 1, name: 'Tdap/Td booster', period: 'Nov 10 2031', total: 1),
      ],
    );
  }
}
