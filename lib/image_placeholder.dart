import 'dart:ui';
import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  int width;
  int height;
  Color backgroundColor;
  Color textColor;
  String? text;
  String? formatType;

  ImagePlaceholder(
      {required this.width,
      required this.height,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.formatType = 'png',
      this.text});

  Widget build(BuildContext context) {
    String backgroundColor1 = backgroundColor.toHex().replaceAll('ff', '');
    String textColor1 = textColor.toHex().replaceAll('ff', '');

    return text == null
        ? Image.network(
            'https://via.placeholder.com/$width x $height.$formatType/$backgroundColor1/$textColor1')
        : Image.network(
            'https://via.placeholder.com/$width x $height.$formatType/$backgroundColor1/$textColor1?text=$text');
  }
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = false}) =>
      '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

