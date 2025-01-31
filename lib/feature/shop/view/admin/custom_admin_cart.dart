import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/shop/view_model/sell_controller.dart';
import 'package:tech_mart/shared/model/color_model.dart';
import 'package:tech_mart/shared/widget/utils/toast.dart';

class CustomAdminCart extends ConsumerStatefulWidget {
  final int index;
  final Color borderColor;
  const CustomAdminCart({
    super.key,
    required this.index,
    required this.borderColor
  });

  @override
  ConsumerState<CustomAdminCart> createState() => _CustomAdminCartState();
}

class _CustomAdminCartState extends ConsumerState<CustomAdminCart> {
  @override
  Widget build(BuildContext context) {
    final sell = ref.watch(sellProvider).sells?[widget.index];
    final double containerWidth = MediaQuery.of(context).size.width - 36;
    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: colorList[widget.index % 4].borderColor,
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
              child: Text(sell!.productName, maxLines: 1, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text("Brand: ${sell.brand}", maxLines: 1, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                children: [
                  Text("Price: ${sell.price}, Discount: ${sell.discount}% Off", maxLines: 1, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                children: [
                  Text(sell.description, maxLines: 3, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text("Customer Information:", maxLines: 1, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text("Name: ${sell.name}", maxLines: 1, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text("Address: ${sell.address}", maxLines: 1, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text("Phone: ${sell.phone}", maxLines: 1, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                bool isCancel = await ref.read(sellProvider.notifier).deleteSell(id: sell.id!, productId: sell.productId);
                if (isCancel) {
                  Toast.showToast(context: context, message: "Order Canceled!");
                } else {
                  Toast.showToast(context: context, message: "Server Error!", isWarning: true);
                }
              },
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  color: colorList[widget.index % 4].insideColor,
                  border: Border.all(
                    color: colorList[widget.index % 4].borderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: ref.watch(sellProvider).isLoading? Center(child: CircularProgressIndicator()) : Text("Cancel Order",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorList[widget.index % 4].borderColor))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}