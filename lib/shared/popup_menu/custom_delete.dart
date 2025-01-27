import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/image_path.dart';
import '../containers/custom_image.dart';

class CustomDelete extends StatefulWidget {
  final Function(int) status;
  const CustomDelete({super.key, required this.status});

  @override
  State<CustomDelete> createState() => _CustomDeleteState();
}

class _CustomDeleteState extends State<CustomDelete> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: Colors.white,
      icon: CustomImage(height: 28, width: 28, imagePath: ImagePath.more),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: (value) {
        widget.status(value);
        if (kDebugMode) {
          print("Selected: $value");
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 1,
            child: Column(
              children: [
                const SizedBox(height: 13),
                Row(
                  children: [
                    CustomImage(height: 22, width: 22, imagePath: ImagePath.edit),
                    const SizedBox(width: 8),
                    const Text("Edit", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          PopupMenuItem<int>(
            value: 2,
            child: Column(
              children: [
                const Divider(color: Color(0xffe1e4ea)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.delete),
                    const SizedBox(width: 8),
                    const Text("Delete", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          PopupMenuItem<int>(
            value: 3,
            child: Column(
              children: [
                const Divider(color: Color(0xffe1e4ea)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    CustomImage(height: 22, width: 22, imagePath: ImagePath.cancel),
                    const SizedBox(width: 8),
                    const Text("Cancel", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ];
      },
      menuPadding: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
    );
  }
}
