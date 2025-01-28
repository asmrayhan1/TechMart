import 'package:flutter/material.dart';
import 'package:tech_mart/feature/shop/view/admin/custom_admin_cart.dart';
import 'package:tech_mart/feature/shop/view/user/custom_user_cart.dart';

import '../../../../core/extensions/image_path.dart';
import '../../../../shared/buttons/custom_text_button.dart';
import '../../../../shared/containers/custom_image.dart';
import '../../../../shared/model/category_model.dart';

class AdminShopScreen extends StatefulWidget {
  const AdminShopScreen({super.key});

  @override
  State<AdminShopScreen> createState() => _AdminShopScreenState();
}

class _AdminShopScreenState extends State<AdminShopScreen> {
  List<bool> isSelected = [true, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
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
            Center(child: CustomAdminCart(index: 0, status: true, title: "System Testing", description: "description sdfsdf sdfdsfdsf  sdfsdf sf sdfsdf sdfsddsf", borderColor: Colors.green)),
            const SizedBox(height: 10),
            Center(child: CustomAdminCart(index: 1, status: true, title: "System Testing", description: "description sdfsdf sdfdsfdsf  sdfsdf sf sdfsdf sdfsddsf", borderColor: Colors.green)),
            const SizedBox(height: 10),
            Center(child: CustomAdminCart(index: 2, status: true, title: "System Testing", description: "description sdfsdf sdfdsfdsf  sdfsdf sf sdfsdf sdfsddsf", borderColor: Colors.green)),
            const SizedBox(height: 10),
            Center(child: CustomAdminCart(index: 3, status: true, title: "System Testing", description: "description sdfsdf sdfdsfdsf  sdfsdf sf sdfsdf sdfsddsf", borderColor: Colors.green)),
            const SizedBox(height: 10),
            Center(child: CustomAdminCart(index: 4, status: true, title: "System Testing", description: "description sdfsdf sdfdsfdsf  sdfsdf sf sdfsdf sdfsddsf", borderColor: Colors.green)),
            const SizedBox(height: 10),
            Center(child: CustomAdminCart(index: 5, status: true, title: "System Testing", description: "description sdfsdf sdfdsfdsf  sdfsdf sf sdfsdf sdfsddsf", borderColor: Colors.green)),
            const SizedBox(height: 10),
            Center(child: CustomAdminCart(index: 6, status: true, title: "System Testing", description: "description sdfsdf sdfdsfdsf  sdfsdf sf sdfsdf sdfsddsf", borderColor: Colors.green)),
            const SizedBox(height: 10),
            Center(child: CustomAdminCart(index: 7, status: true, title: "System Testing", description: "description sdfsdf sdfdsfdsf  sdfsdf sf sdfsdf sdfsddsf", borderColor: Colors.green)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
