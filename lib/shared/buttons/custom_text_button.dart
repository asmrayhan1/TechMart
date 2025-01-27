import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final bool isSelected;
  final String title;
  const CustomTextButton({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFFD0D5DD),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: widget.isSelected ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
