import 'package:flutter/material.dart';

class ColorModel {
  Color colorA;
  Color colorB;

  ColorModel({required this.colorA, required this.colorB});

  static List<ColorModel> colors = [
    ColorModel(colorA: Colors.black, colorB: Colors.red),
    ColorModel(colorA: Colors.blue, colorB: Colors.green),
    ColorModel(colorA: Colors.green, colorB: Colors.yellow),
  ];
}
