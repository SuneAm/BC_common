import 'package:flutter/material.dart';

class OrdrerColors {
  static const Color kEditorColor = Color.fromARGB(255, 150, 198, 245),
      kMontageAppColor = Color(0xffe86f25),
      kProduktionAppColor = Colors.grey;
}

enum PeopleColor {
  blue([154, 199, 244]),
  turquoise([82, 181, 159]),
  green([99, 203, 101]),
  yellow([232, 218, 101]),
  brown([188, 136, 97]),
  red([255, 97, 97]),
  pink([255, 118, 212]),
  marine([101, 125, 255]),
  purple([164, 104, 255]);

  const PeopleColor(this.rgb);

  final List<int> rgb;
}
