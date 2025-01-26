import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String txt;
  final double containerHeight;
  final double containerWidth;
  final Color containerColor;
  const CustomContainer({super.key, required this.txt, required this.containerColor, required this.containerWidth, required this.containerHeight});

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
        child: Text(txt, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
      ),
    );
  }
}
