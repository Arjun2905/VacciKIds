import 'package:cloud_firestore/cloud_firestore.dart';

class Vaccine {
  String sr;
  final String dose;
  final String duration;
  final String usedFor;
  final String info;
  final String name;

  Vaccine({
    this.sr = '',
    required this.dose,
    required this.duration,
    required this.usedFor,
    required this.info,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    'sr': sr,
    'dose': dose,
    'duration': duration,
    'usedFor': usedFor,
    'info': info,
    'name': name,
  };

  static Vaccine fromJson(Map<String, dynamic> json) => Vaccine(
    dose: json['dose'], 
    duration: json['duration'], 
    usedFor: json['usedFor'], 
    info: json['info'], 
    name: json['name']
    );

}

//dose, duration, usedfor, info, name, sr