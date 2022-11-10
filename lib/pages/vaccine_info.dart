import 'package:firebase_core/firebase_core.dart';
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
  final snapshots = await FirebaseFirestore.instance.collection('vaccines').doc('b2765770-60c4-11ed-9460-5340af1462ae').get();
  // print('object');
  // print(await docVacc.get());
  // final snapshot = await docVacc;
  // print(snapshot.data());
  // return snapshot;
  if(snapshots.exists){
    print(snapshots.data());
    return Vaccine.fromJson(snapshots.data()!);
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


      // Text('aka other_name1, other_name2', style: TextStyle(fontWeight: FontWeight.w500),)
    ],
  ),
);


final testDuration = ["Example1", "Example2", "Example3", "Example100"];
Widget textSection(Vaccine vaccine) => Container(
  margin: const EdgeInsets.only(top: 20, bottom: 30),
    child: Column(
      children: [
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
                // text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                // 'Quis ultricies ipsum mattis elit vehicula vestibulum. '
                // 'Egestas in tortor egestas sociis gravida habitasse. '
                // 'Lectus scelerisque luctus elementum s elementums elementums elementums elementum',
                text: vaccine.info,
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
                // text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                //     'Quis ultricies ipsum mattis elit vehicula vestibulum. '
                //     'Egestas in tortor egestas sociis gravida habitasse. '
                //     'Lectus scelerisque luctus elementum s elementums elementums elementums elementum',
                text: vaccine.duration,
                style: TextStyle(fontSize: 15)
            ),
          ),


        ),


        // Padding(
        //   padding: EdgeInsets.only(bottom: 10.0),
        //   child: Text(
        //     'Known Side Effects',
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //     textAlign: TextAlign.left,
        //   ),
        // ),

        // Padding(
        //   padding: EdgeInsets.only(bottom: 10.0),
        //   child: Text.rich(
        //     TextSpan(
        //         text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        //             'Quis ultricies ipsum mattis elit vehicula vestibulum. ',
        //         style: TextStyle(fontSize: 15)
        //     ),
        //   ),
        // ),

        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Dose',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text.rich(
            TextSpan(
                text: vaccine.dose,
                style: TextStyle(fontSize: 15)
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Used For',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text.rich(
            TextSpan(
                // text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                //     'Quis ultricies ipsum mattis elit vehicula vestibulum. ',
                text: vaccine.usedFor,
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
                builder: (context, AsyncSnapshot<Vaccine?> snapshots) {
                  print("object");
                  print(snapshots.hasData);
                  if(snapshots.hasData){
                    final vaccine = snapshots.data;
                    // print(vaccine.name.toString());
                    return vaccine == null
                           ? Center(child: Text('No User'),)
                           : Column(
                              children: [
                                titleSection(vaccine),
                                textSection(vaccine),
                              ],
                           ); 
                  }
                  else{ 
                    // return Center(child: CircularProgressIndicator(),);
                    print("HREHREHREHREHRHE");
                    return const Center(child: Text('sadsa'));
                  }
                  // return const Center(child: Text('sadsa'));
                },
                ),
                
                // textSection,
            ],
          ),
      ),
    );
  }

  // Widget titleSection = const Padding(
  //   padding: ,
  // );

}
