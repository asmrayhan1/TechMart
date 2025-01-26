import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/image_path.dart';
import '../containers/custom_image.dart';

class CustomChangeImage extends StatefulWidget {
  const CustomChangeImage({super.key});

  @override
  State<CustomChangeImage> createState() => _CustomChangeImageState();
}

class _CustomChangeImageState extends State<CustomChangeImage> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: Colors.white,
      icon: CustomImage(height: 28, width: 28, imagePath: ImagePath.more),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: (value) {
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
                    CustomImage(height: 22, width: 22, imagePath: ImagePath.change),
                    const SizedBox(width: 8),
                    const Text("Logout", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          const PopupMenuItem<int>(
            value: 2,
            child: Column(
              children: [
                Divider(color: Color(0xffe1e4ea)),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.logout_outlined, color: Color(0xff17a38f), size: 22),
                    SizedBox(width: 8),
                    Text("Logout", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
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
