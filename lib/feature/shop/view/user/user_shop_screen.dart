import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/shop/view_model/sell_controller.dart';

import '../../../../core/extensions/image_path.dart';
import '../../../../shared/buttons/custom_text_button.dart';
import '../../../../shared/containers/custom_image.dart';
import '../../../../shared/model/category_model.dart';
import 'custom_user_cart.dart';

class UserShopScreen extends ConsumerStatefulWidget {
  const UserShopScreen({super.key});

  @override
  ConsumerState<UserShopScreen> createState() => _UserShopScreenState();
}

class _UserShopScreenState extends ConsumerState<UserShopScreen> {
  List<bool> isSelected = [true, false, false, false, false, false, false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      ref.read(sellProvider.notifier).sellInitialize();
      if (kDebugMode) {
        print("Len = ${ref.watch(sellProvider).sells!.length}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final sell = ref.watch(sellProvider);
    return Scaffold(
      backgroundColor: Color(0xfff2f4f5),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FB), //Colors.white,
        title: Row(
          children: [
            CustomImage(
              height: 30,
              width: 30,
              imagePath: ImagePath.app_logo,
            ),
            Text("TechMart", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xff188273)),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categoryList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        for (int i = 0; i < categoryList.length; i++){
                          setState(() {
                            if (i == index) {
                              isSelected[i] = true;
                            } else {
                              isSelected[i] = false;
                            }
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: CustomTextButton(
                          isSelected: isSelected[index],
                          title: categoryList[index].title,
                        ),
                      ),
                    );
                  },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sell.sells?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: CustomUserCart(index: index, borderColor: Colors.green),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
