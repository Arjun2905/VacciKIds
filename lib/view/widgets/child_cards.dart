import 'package:flutter/material.dart';
import 'package:vacci_kids/view/screens/vaccine_schedule.dart';
class ChildCard extends StatefulWidget{
  const ChildCard({Key? key, required this.name, required this.age}) : super(key: key);
  final String name;
  final int age;
  @override
  State<StatefulWidget> createState() => MyCard();
}

class MyCard extends State<ChildCard>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const VaccineScheduleScreen()));
        });
      },
      child: Card(
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
            ),
            Padding(
              child : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                Text(widget.name),
                Text(widget.age.toString())]
            ), padding: const EdgeInsets.only(right: 10.0)
            ),
          ],
        ),
      ),
    );
  }
}