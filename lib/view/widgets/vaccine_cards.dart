import 'package:flutter/material.dart';
import 'package:vacci_kids/view/screens/vaccine_info.dart';

class VaccineCard extends StatefulWidget{
  final String name;
  final String info;
  final String vacc_for;
  final String duration;
  final String dose;
  final String sr;
  const VaccineCard({Key? key, required this.name, required this.info,
    required this.vacc_for, required this.duration, required this.dose,
    required this.sr}) : super(key: key);
  @override
  State<StatefulWidget> createState() => MyCard();
}

class MyCard extends State<VaccineCard>{

  String getName(String name){
    if(name.length>6){
      return name.substring(0,6)+'...';
    }
    return name;
  }

  String getDuration(String duration){
    if(duration.contains("range")){
      return "Between "+duration.substring(7,8)+" to "+duration.substring(9,10);
    }

    if(duration=="0"){
      return "Before first month";
    }
    return "Within "+duration+" months";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> VaccineInfo(
                  name: widget.name,
                  vaccFor: widget.vacc_for,
                  duration: getDuration(widget.duration),
                  dose: widget.dose,
                  info: widget.info
              )
              )
          );
          print("Vaccine Added");
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.passthrough,
          children: <Widget>[
            Image.asset("assets/images/asset_2.png",
              height: MediaQuery.of(context).size.height*0.10,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children : [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.sr+"/49"),
                    Text('Name     : '+getName(widget.name)),
                    Text('Dose     : '+widget.dose),
                    Text('Duration : '+getDuration(widget.duration)),
                  ],
                ),
                // SizedBox(width: MediaQuery.of(context).size.width*0.30),
                // Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       IconButton(onPressed: (){
                //         setState(() {
                //         });
                //       }, icon: const Icon(Icons.more_vert)
                //       ),
                //       SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                //       Checkbox(value: false,onChanged: (value){
                //         value=true;
                //       },)
                //     ]
                // ),
              ],
            ),
          ]
        ),
      )
    );
  }
}