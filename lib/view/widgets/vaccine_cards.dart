import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          print("Vaccine Added");
        });
      },
      child: Card(
        elevation: 8,
        shadowColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          fit: StackFit.passthrough,
          children: <Widget>[
            Image.asset("assets/images/asset_1.png",
              height: MediaQuery.of(context).size.height*0.20,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children : [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Name : '+widget.name),
                    Text('Duration : '+widget.duration),
                    Text('Dose : '+widget.dose),
                    Text('For : '+widget.vacc_for),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.30),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          // PopupMenuButton(itemBuilder: [TextButton(onPressed: (){}, child: Text("Info"))])
                        });
                      }, icon: const Icon(Icons.more_vert)
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                      Checkbox(value: false,onChanged: (value){
                        value=true;
                      },)
                    ]
                ),
              ],
            ),
          ]
        ),
      )
    );
  }
}