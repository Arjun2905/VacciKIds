import 'package:flutter/material.dart';

class VaccineInfo extends StatelessWidget {
  final String name;
  final String vaccFor;
  final String duration;
  final String dose;
  final String info;
  const VaccineInfo({Key? key, required this.name, required this.vaccFor,
    required this.duration, required this.dose, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleSection(context),
            textSection(context),
          ],
        ),
      )
    );
  }

  Widget titleSection(BuildContext context) => Container(
    // padding: const EdgeInsets.all(25),
    // margin: const EdgeInsets.only(top:0),
    height: MediaQuery.of(context).size.height*0.30,
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/asset_12.png'),
      fit: BoxFit.cover,opacity: 0.8,filterQuality: FilterQuality.high)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(name,
              textAlign: TextAlign.justify,
              softWrap: true,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget textSection(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 20, bottom: 30),
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
          child: Text(
            'Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10.0,right: 10.0,left: 10.0,bottom: 10.0),
          child: Text.rich(
            TextSpan(
                text: info,
                style: const TextStyle(fontSize: 16),
            ),
            textAlign: TextAlign.justify,
          ),
        ),


        const Padding(
          padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
          child: Text(
            'Duration',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10.0,right: 10.0,left: 10.0,bottom: 10.0),
          child: Text.rich(
            TextSpan(
                text: duration,
                style: const TextStyle(fontSize: 16)
            ),
            textAlign: TextAlign.justify,
          ),
        ),


        // const Padding(
        //   padding: EdgeInsets.only(right: 10.0,left: 10.0,bottom: 10.0),
        //   child: Text(
        //     'Known Side Effects',
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //     textAlign: TextAlign.left,
        //   ),
        // ),
        //
        // const Padding(
        //   padding: EdgeInsets.only(right: 10.0,left: 10.0,bottom: 10.0),
        //   child: Text.rich(
        //     TextSpan(
        //         text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        //             'Quis ultricies ipsum mattis elit vehicula vestibulum. ',
        //         style: TextStyle(fontSize: 16)
        //     ),
        //     textAlign: TextAlign.justify,
        //   ),
        // ),
      ],
    ),
  );
}
