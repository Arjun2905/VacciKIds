import 'package:flutter/material.dart';
import 'package:vacci_kids/view/screens/vaccine_schedule.dart';
<<<<<<< HEAD
=======
import 'package:intl/intl.dart';
>>>>>>> 435dc1ec0b54acc2ccf1b7bdee9dba68503f6966

class ChildCard extends StatefulWidget {
  final String childId;
  const ChildCard(
      {Key? key, required this.name, required this.age, required this.childId})
      : super(key: key);
  final String? name;
  final String? age;
  @override
  State<StatefulWidget> createState() => MyCard();
}

class MyCard extends State<ChildCard> {
  @override
  Widget build(BuildContext context) {
    String age = calculateAge(widget.age.toString());
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VaccineScheduleScreen(
                        childId: widget.childId,
                      )));
        });
      },
      child: Card(
        color: Colors.greenAccent[100],
        elevation: 15,
        shadowColor: Colors.black45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          fit: StackFit.passthrough,
          children: <Widget>[
            Image.asset(
              "assets/images/asset_1.png",
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
            Padding(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
<<<<<<< HEAD
                        SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                        Text(widget.name.toString(), style: const TextStyle(color: Colors.indigoAccent),),
                        Text(age, style: const TextStyle(color: Colors.indigoAccent),),
                      ]
                  ),
                ), padding: const EdgeInsets.only(right: 10.0)
            ),
=======
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Text(
                          widget.name.toString(),
                          style: const TextStyle(color: Colors.indigoAccent),
                        ),
                        Text(
                          age,
                          style: const TextStyle(color: Colors.indigoAccent),
                        ),
                      ]),
                ),
                padding: const EdgeInsets.only(right: 10.0)),
>>>>>>> 435dc1ec0b54acc2ccf1b7bdee9dba68503f6966
          ],
        ),
      ),
    );
  }
}

String calculateAge(String dateString) {
  DateTime birthDate = DateTime.parse(dateString.split('-').reversed.join('-'));
  print(birthDate);
  DateTime currentDate = DateTime.now();
  int days = currentDate.difference(birthDate).inDays;
  int months = (currentDate.year - birthDate.year) * 12 +
      currentDate.month -
      birthDate.month;
  int years = currentDate.year - birthDate.year;
  String age = '$days D, $months M, $years Y';
  if (years == 0) {
    age = "$days D, $months M";
  }
  if (months == 0 && years == 0) {
    age = "$days D";
  }
  return age;
}
