import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/shop/view_model/sell_controller.dart';

import '../../../../shared/model/color_model.dart';
import '../../../../shared/widget/utils/toast.dart';

class CustomUserCart extends ConsumerStatefulWidget {
  final int index;
  final Color borderColor;
  const CustomUserCart({
    super.key,
    required this.index,
    required this.borderColor
  });

  @override
  ConsumerState<CustomUserCart> createState() => _CustomUserCartState();
}

class _CustomUserCartState extends ConsumerState<CustomUserCart> {
  bool cancel = false, receive = false;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sell = ref.watch(sellProvider).sells![widget.index];
    final double containerWidth = MediaQuery.of(context).size.width - 36;
    final double w = (containerWidth - 32) / 2;
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
              child: Column(
                children: [
                  Text(sell.productName, maxLines: 1, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                ],
              ),
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
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                children: [
                  Text(sell.description, maxLines: 4, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    setState(() {receive = true;});
                    bool isCancel = await ref.read(sellProvider.notifier).deleteSell(id: sell.id!, productId: sell.productId);
                    if (isCancel) {
                      Toast.showToast(context: context, message: "Received!");
                    } else {
                      setState(() {receive = false;});
                      Toast.showToast(context: context, message: "Server Error!", isWarning: true);
                    }
                  },
                  child: Container(
                    height: 25,
                    width: w,
                    decoration: BoxDecoration(
                      color: colorList[widget.index % 4].insideColor,
                      border: Border.all(
                        color: colorList[widget.index % 4].borderColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ref.watch(sellProvider).isLoading && receive ? Center(child: CircularProgressIndicator()) : Center(
                        child: Text("Received",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorList[widget.index % 4].borderColor))),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {cancel = true;});
                    bool isCancel = await ref.read(sellProvider.notifier).deleteSell(id: sell.id!, productId: sell.productId);
                    if (isCancel) {
                      Toast.showToast(context: context, message: "Order Canceled!");
                    } else {
                      setState(() {cancel = false;});
                      Toast.showToast(context: context, message: "Server Error!", isWarning: true);
                    }
                  },
                  child: Container(
                    height: 25,
                    width: w,
                    decoration: BoxDecoration(
                      color: colorList[widget.index % 4].insideColor,
                      border: Border.all(
                        color: colorList[widget.index % 4].borderColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: ref.watch(sellProvider).isLoading && cancel ? Center(child: CircularProgressIndicator()) : Text("Cancel Order",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorList[widget.index % 4].borderColor))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}