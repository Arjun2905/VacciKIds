import 'package:flutter/material.dart';
import 'package:vacci_kids/view/screens/vaccine_schedule.dart';
class ChildCard extends StatefulWidget{
  const ChildCard({Key? key, required this.name, required this.age}) : super(key: key);
  final String? name;
  final String? age;
  @override
  State<StatefulWidget> createState() => MyCard();
}

class MyCard extends State<ChildCard>{
  @override
  Widget build(BuildContext context) {
    String x = calculateAge(widget.age.toString());
    return GestureDetector(
      onTap: (){
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const VaccineScheduleScreen()));
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
            Image.asset("assets/images/asset_1.png",
              height: MediaQuery.of(context).size.height*0.20,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
            Padding(
                child : Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                        Text(widget.name.toString(), style: TextStyle(color: Colors.indigoAccent),),
                        Text("$x", style: TextStyle(color: Colors.indigoAccent),),
                      ]
                  ),
                ), padding: const EdgeInsets.only(right: 10.0)
            ),
          ],
        ),
      ),
    );
  }
}


String calculateAge(String dateString) {
  DateTime birthDate = DateTime.parse(dateString.split('-').reversed.join('-'));
  DateTime currentDate = DateTime.now();
  int days = currentDate.difference(birthDate).inDays;
  int months = (currentDate.year - birthDate.year) * 12 + currentDate.month - birthDate.month;
  int years = currentDate.year - birthDate.year;
  String age = '$days D, $months M, $years Y';
  if(years==0) {
    age = "$days D, $months M";
  }
  if(months==0 && years==0) {
    age = "$days D";
  }
  return age;
}
