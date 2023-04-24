import 'package:flutter/material.dart';
import 'package:vacci_kids/view/screens/vaccine_schedule.dart';

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
    String age = calculateAge(widget.age.toString()) as String;
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
          ],
        ),
      ),
    );
  }
}

Object calculateAge(String dateString)  {

  DateTime currentDate = DateTime.now();

  late int indexOfFirstHyphen, indexOfSecondHyphen, i;
  for(i=0; i<dateString.length; i++) {
    if(dateString[i] == "-") {
      indexOfFirstHyphen = i;
      break;
    }
  }
  for(i=indexOfFirstHyphen+1; i<dateString.length; i++) {
    if(dateString[i]=="-") {
      indexOfSecondHyphen = i;
    }
  }
  int days = currentDate.day - int.parse(dateString.substring(0,indexOfFirstHyphen));
  int months = currentDate.month - int.parse(dateString.substring(indexOfFirstHyphen+1, indexOfSecondHyphen));
  int years = currentDate.year - int.parse(dateString.substring(indexOfSecondHyphen+1, i));

  if(months==0 && years==0) {
    return days.toString() +  " D";
  }
  if(years == 0) {
    return months.toString() + " M";
  }
  return years.toString() + " Y";
}
