import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  const CustomTextButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            (title == "All") ? Colors.black : Colors.white,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Color(0xFFD0D5DD),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Text(
            title,
            style:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: (title == "All") ? Colors.white : null),
          ),
        ),
      ),
    );
  }
}
