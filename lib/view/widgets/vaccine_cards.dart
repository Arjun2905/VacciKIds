import 'package:flutter/material.dart';
import 'package:vacci_kids/view/screens/vaccine_info.dart';

class VaccineCard extends StatefulWidget {
  final String name;
  final String info;
  final String vaccFor;
  final String duration;
  final String dose;
  final String sr;
  bool isActive;
  VaccineCard(
      {Key? key,
        required this.name,
        required this.info,
        required this.vaccFor,
        required this.duration,
        required this.dose,
        required this.sr,
        this.isActive = false})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => MyCard();
}

class MyCard extends State<VaccineCard> {
  String getName(String name) {
    if (name.length > 6) {
      return name.substring(0, 6) + '...';
    }
    return name;
  }

  String getDuration(String duration) {
    if (duration.contains("range")) {
      return "Between " +
          duration.substring(7, 8) +
          " to " +
          duration.substring(9, 10);
    }

    if (duration == "0") {
      return "Before first month";
    }
    return "Within " + duration + " months";
  }

  Color getBackgroundColor() {
    return widget.isActive ? Colors.green[100]! : Colors.yellow[100]!;
  }

  Color getTextColor() {
    return widget.isActive ? Colors.green[900]! : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VaccineInfo(
                        name: widget.name,
                        vaccFor: widget.vaccFor,
                        duration: getDuration(widget.duration),
                        dose: widget.dose,
                        info: widget.info)));
            print("Vaccine Added");
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: getBackgroundColor(),
          child: Stack(
              alignment: AlignmentDirectional.topStart,
              fit: StackFit.passthrough,
              children: <Widget>[
                // Image.asset(
                //     "assets/images/asset_2.png",
                //     height: MediaQuery.of(context).size.height * 0.10,
                //     width: MediaQuery.of(context).size.width,
                //     fit: BoxFit.cover,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: widget.isActive,
                      onChanged: (value) {
                        setState(() {
                          widget.isActive = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Padding(padding: const EdgeInsets.all(5),
                        child : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.sr + "/49",
                              style: TextStyle(color: getTextColor())),
                          Text('Name     : ' + getName(widget.name),
                              style: TextStyle(color: getTextColor())),
                          Text('Dose     : ' + widget.dose,
                              style: TextStyle(color: getTextColor())),
                          Text('Duration : ' + getDuration(widget.duration),
                              style: TextStyle(color: getTextColor())),
                        ],
                      ),
                    ),
                    )
                  ],
                ),
              ]),
        ));
  }
}