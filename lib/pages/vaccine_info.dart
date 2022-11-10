import 'package:flutter/material.dart';
// import 'flutter/flutter_markdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice1/model/vaccine.dart';


// Stream<List<Vaccine>> readUser() => FirebaseFirestore.instance
//   .collection('vaccines')
//   .snapshots()
//   .map((snapshot) => 
//       snapshot.docs.map((doc) => Vaccine.fromJson(doc.data())).toList());

Future<Vaccine?> readVaccine() async{
  final docVacc = FirebaseFirestore.instance.collection('vaccines').doc('testvacc');
  final snapshot = await docVacc.get();

  if(snapshot.exists){
    return Vaccine.fromJson(snapshot.data()!);
  }
}

 Widget titleSection(Vaccine vaccine) =>  Container(
  padding: const EdgeInsets.all(50),
  // margin: const EdgeInsets.only(top:0),
  height: 220.0,
  color: Colors.grey[400],
  child: Column(
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: Text(
            vaccine.name,
            softWrap: true,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),

      ),


      Text('aka other_name1, other_name2', style: TextStyle(fontWeight: FontWeight.w500),)
    ],
  ),
);


final testDuration = ["Example1", "Example2", "Example3", "Example100"];
final Widget textSection = Container(
  margin: const EdgeInsets.only(top: 20, bottom: 30),
    child: Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Text.rich(
            TextSpan(
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Quis ultricies ipsum mattis elit vehicula vestibulum. '
                'Egestas in tortor egestas sociis gravida habitasse. '
                'Lectus scelerisque luctus elementum s elementums elementums elementums elementum',
              style: TextStyle(fontSize: 15)
            ),
          ),
        ),


        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Duration',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text.rich(
            TextSpan(
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Quis ultricies ipsum mattis elit vehicula vestibulum. '
                    'Egestas in tortor egestas sociis gravida habitasse. '
                    'Lectus scelerisque luctus elementum s elementums elementums elementums elementum',
                style: TextStyle(fontSize: 15)
            ),
          ),


        ),


        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Known Side Effects',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text.rich(
            TextSpan(
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Quis ultricies ipsum mattis elit vehicula vestibulum. ',
                style: TextStyle(fontSize: 15)
            ),
          ),
        ),
      ],
    ),
);

class VaccineInfo extends StatefulWidget {
  const VaccineInfo({Key? key}) : super(key: key);

  @override
  State<VaccineInfo> createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vaccine Info",

      home: Scaffold(
        // appBar: AppBar(),
          body: Column(
            children: [
              // titleSection(vaccine),
              // textSection,
              FutureBuilder<Vaccine?>(
                future: readVaccine(),
                builder: (context, snapshot) {
                  print(snapshot);
                  if(snapshot.hasData){
                    final vaccine = snapshot.data;
                    // print(vaccine.name.toString());
                    return vaccine == null
                           ? Center(child: Text('No User'),)
                           : titleSection(vaccine);
                  }
                  else{ 
                    // return Center(child: CircularProgressIndicator(),);
                    return const Center(child: Text('sadsa'));
                  }
                  // return const Center(child: Text('sadsa'));
                },
                ),
                textSection,
            ],
          ),
      ),
    );
  }

  // Widget titleSection = const Padding(
  //   padding: ,
  // );

}
