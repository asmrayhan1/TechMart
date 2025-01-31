import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/core/extensions/image_path.dart';
import 'package:tech_mart/feature/product/view_model/product_controller.dart';
import 'package:tech_mart/feature/profile/view_model/user_controller.dart';
import 'package:tech_mart/feature/shop/view_model/sell_controller.dart';
import 'package:tech_mart/shared/containers/custom_container.dart';
import 'package:tech_mart/shared/containers/custom_image.dart';
import 'package:tech_mart/shared/containers/custom_rating.dart';
import 'package:tech_mart/shared/widget/utils/toast.dart';

import '../../auth/login/view/login_screen.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final int index;
  const ProductDetailsScreen({super.key, required this.index});

  @override
  ConsumerState<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider).products?[widget.index];
    final user = ref.watch(userProvider).users;
    double w = MediaQuery.of(context).size.width - 100;
    return Scaffold(
      backgroundColor: Color(0xfff2f4f7), //Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff2f4f7), //Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.all(12.0),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color(0xffc0c1ce)
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Icon(Icons.arrow_back, color: Colors.black, size: 20)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: w,
                  width: w,
                  child: Image.network("https://dkcsxccdmdunftexgdkc.supabase.co/storage/v1/object/public/${product?.image}", fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 30),
              Text(
                product!.itemName,
                style: TextStyle(
                  color: Color(0xFF344054), fontSize: 20, fontWeight: FontWeight.bold,
                  decoration: (product.totalCount == 0) ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Brand: ${product.brand}",
                style: TextStyle(color: Color(0xFF101828), fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Product Details:",
                    style: TextStyle(color: Color(0xFF101828), fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(product.description, textAlign: TextAlign.justify),
              SizedBox(height: 15),
              Text(
                "Price: ${product.price} Taka",
                style: TextStyle(color: Color(0xFF101828), fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                "Discount: ${product.discount}% Off",
                style: TextStyle(color: Color(0xFF101828), fontSize: 16, fontWeight: FontWeight.w600),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomContainer(txt: "2000 Taka", fntSize: 14, fntWeight: FontWeight.w500, containerColor: Colors.black, containerWidth: 100, containerHeight: 35),
              //     SizedBox(width: 20),
              //     CustomContainer(txt: "30% Off", fntSize: 14, fntWeight: FontWeight.w500, containerColor: Colors.black, containerWidth: 80, containerHeight: 35),
              //   ],
              // ),
              SizedBox(height: 50),
              if (isAdmin != null && isAdmin == false) Center(
                child: GestureDetector(
                  onTap: () async {
                    if (user == null || user.address!.isEmpty){
                      Toast.showToast(context: context, message: "Please fill your profile information!", isWarning: true);
                    } else if (product.totalCount == 0){
                      Toast.showToast(context: context, message: "Out of Stock!");
                    } else {
                      bool isOrder = await ref.read(sellProvider.notifier).insertSell(
                        productId: product.id!, email: user.email!, name: user.name!, phone: user.phone!, brand: product.brand,
                        category: product.category, address: user.address!, productName: product.itemName, description: product.description, price: product.price, discount: product.discount
                      );
                      if (kDebugMode) {
                        print("Discount = ${product.category},  ${product.brand}");
                      }
                      if (isOrder){
                        Toast.showToast(context: context, message: "Ordered Done!");
                      } else {
                        Toast.showToast(context: context, message: "Server Error!", isWarning: true);
                      }
                    }
                  },
                  child: CustomContainer(status: ref.watch(sellProvider).isLoading ? true : false, txt: "Order Now", fntSize: 16, fntWeight: FontWeight.bold, containerColor: Color(0xff188273), containerWidth: w + 10, containerHeight: 50)
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
