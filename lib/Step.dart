import 'dart:ui';

import 'package:flutter/material.dart';

Step getStep(
    {required String name,
    required String period,
    required int dose,
    required int total}) {
  // returning value result
  return Step(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              name,
              style: TextStyle(
                  color: Color(0xff353536),
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Color(0xffd6def9)),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              period,
              style: TextStyle(color: Color(0xff313131), fontSize: 14),
            ),
          ),
        ),
      ],
    ),
    content: Container(
        padding: EdgeInsets.only(left: 6),
        alignment: Alignment.centerLeft,
        child: Text('Dose ${dose} of ${total}')),
  );
}
