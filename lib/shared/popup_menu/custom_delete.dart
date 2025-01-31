import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/product/view/update_product.dart';
import 'package:tech_mart/feature/product/view_model/product_controller.dart';
import 'package:tech_mart/shared/widget/utils/toast.dart';

import '../../core/extensions/image_path.dart';
import '../containers/custom_image.dart';

class CustomDelete extends ConsumerStatefulWidget {
  final int index;
  const CustomDelete({super.key, required this.index});

  @override
  ConsumerState<CustomDelete> createState() => _CustomDeleteState();
}

class _CustomDeleteState extends ConsumerState<CustomDelete> {
  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider).products;
    return PopupMenuButton<int>(
      color: Colors.white,
      icon: CustomImage(height: 28, width: 28, imagePath: ImagePath.more),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: (value) async {
        if (value == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProduct(index: widget.index)));
        } else if (value == 2){
          bool isDeleted = await  ref.read(productProvider.notifier).deleteProduct(id: product![widget.index].id!);
          if (isDeleted){
            Toast.showToast(context: context, message: "Successfully Deleted!");
          } else {
            Toast.showToast(context: context, message: "Server Error!", isWarning: true);
          }
        }
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
                    ref.watch(productProvider).isLoading? CircularProgressIndicator() : Icon(Icons.delete),
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
