import 'package:flutter/material.dart';
import 'package:vacci_kids/view/screens/vaccine_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineCard extends StatefulWidget {
  final String name;
  final String info;
  final String vaccFor;
  final String duration;
  final String dose;
  final String sr;
  final int lastVaccineSerialNumber;
  final String childId;
  bool isActive;

  VaccineCard({
    Key? key,
    required this.name,
    required this.info,
    required this.vaccFor,
    required this.duration,
    required this.dose,
    required this.sr,
    required this.lastVaccineSerialNumber,
    required this.childId,
    this.isActive = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VaccineCardState();
}

class _VaccineCardState extends State<VaccineCard> {
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
    return widget.isActive
        ? const Color.fromARGB(255, 144, 252, 148)
        : const Color.fromARGB(255, 254, 239, 141);
  }

  Color getTextColor() {
    return widget.isActive
        ? const Color.fromARGB(255, 1, 58, 5)
        : const Color.fromARGB(255, 24, 23, 23);
  }

  bool get isLocked =>
      int.parse(widget.sr) > widget.lastVaccineSerialNumber + 1 ||
      int.parse(widget.sr) <= widget.lastVaccineSerialNumber;

  bool get shouldBeActive =>
      int.parse(widget.sr) <= widget.lastVaccineSerialNumber;

  @override
  Widget build(BuildContext context) {
    print("sr no and locked status " +
        isLocked.toString() +
        " " +
        widget.sr);

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
                  info: widget.info,
                ),
              ),
            );
            print("Vaccine Added");
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: isLocked
              ? const Color.fromARGB(244, 234, 233, 235)
              : getBackgroundColor(),
          child: Stack(
              alignment: AlignmentDirectional.topStart,
              fit: StackFit.passthrough,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: shouldBeActive ? true : widget.isActive,
                      onChanged: isLocked
                          ? null
                          : (value) async {
                              setState(() {
                                print(widget.isActive.toString() +
                                    value.toString());
                                widget.isActive = value!;
                              });
                              try {
                                final fDoc = FirebaseFirestore.instance
                                    .collection('child_profiles')
                                    .doc(widget.childId);

                                String updateSrNo;
                                if (value!) {
                                  updateSrNo = widget.sr;
                                } else {
                                  int prevSr = int.parse(widget.sr) - 1;
                                  updateSrNo = prevSr.toString();
                                }
                                await fDoc.update({'Track': updateSrNo});
                              } catch (error) {
                                print('Failed to update Track: $error');
                              }
                            },
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.sr + "/49",
                            style: TextStyle(color: getTextColor()),
                          ),
                          Text(
                            'Name     : ' + getName(widget.name),
                            style: TextStyle(color: getTextColor()),
                          ),
                          Text(
                            'Dose     : ' + widget.dose,
                            style: TextStyle(color: getTextColor()),
                          ),
                          Text(
                            'Duration : ' + getDuration(widget.duration),
                            style: TextStyle(color: getTextColor()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}
