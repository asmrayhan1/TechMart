import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  final String txt;
  const CustomRating({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,//Color(0xff188273)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(txt, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
            SizedBox(width: .5),
            Icon(Icons.star, color: Colors.white, size: 15),
          ],
        ),
      ),
    );
  }
}
