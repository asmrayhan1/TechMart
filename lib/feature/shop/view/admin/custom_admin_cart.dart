import 'package:flutter/material.dart';
import 'package:tech_mart/shared/model/color_model.dart';

class CustomAdminCart extends StatelessWidget {
  final int index;
  final bool status;
  final String title;
  final String description;
  final Color borderColor;
  const CustomAdminCart({
    super.key,
    required this.index,
    required this.status,
    required this.title,
    required this.description,
    required this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width - 36;
    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: colorList[index % 4].borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 20, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                children: [
                  Text(description, maxLines: 4, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  color: colorList[index % 4].insideColor,
                  border: Border.all(
                    color: colorList[index % 4].borderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text("Cancel Order",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorList[index % 4].borderColor))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}