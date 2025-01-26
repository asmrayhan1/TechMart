import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String txt;
  final double containerHeight;
  final double containerWidth;
  final Color containerColor;
  final FontWeight fntWeight;
  final double fntSize;
  const CustomContainer({super.key, required this.fntWeight, required this.fntSize, required this.txt, required this.containerColor, required this.containerWidth, required this.containerHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: containerColor,//Color(0xff188273)
      ),
      child: Center(
        child: Text(txt, style: TextStyle(fontSize: fntSize, fontWeight: FontWeight.w500, color: Colors.white)),
      ),
    );
  }
}
