import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/auth/register/view/signup_screen.dart';
import 'package:tech_mart/feature/product/view_model/product_controller.dart';
import 'package:tech_mart/feature/profile/view_model/user_controller.dart';
import 'package:tech_mart/shared/popup_menu/custom_delete.dart';

import '../../../../core/extensions/image_path.dart';
import '../../../../shared/buttons/custom_text_button.dart';
import '../../../../shared/containers/custom_container.dart';
import '../../../../shared/containers/custom_image.dart';
import '../../../../shared/containers/custom_rating.dart';
import '../../../../shared/model/category_model.dart';
import '../../../../shared/popup_menu/custom_logout.dart';
import '../../../details/view/product_details_screen.dart';

class AdminHomeScreen extends ConsumerStatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  ConsumerState<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends ConsumerState<AdminHomeScreen> {
  List<bool> isSelected = [true, false, false, false, false, false, false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) async {
      await ref.read(userProvider.notifier).insertUser(email: insertEmail, name: insertName, phone: insertPhone);
      await ref.read(productProvider.notifier).productInitialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider).products;
    double h = (MediaQuery.of(context).size.width - 20);
    double w = h - h / 2.3;
    return Scaffold(
      backgroundColor: Color(0xfff2f4f7),//Colors.white, // Color(0xffe2e6e6),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FB),//Colors.white, //Color(0xffe2e6e6),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: product?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(index: index)));
                            },
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),  // Rounded corners
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: h / 2.1,
                                      width: h / 2.3,
                                      child: Image.network("https://dkcsxccdmdunftexgdkc.supabase.co/storage/v1/object/public/${product?[index].image}", fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2.0, top: 5, right: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 9,
                                                child: Text(
                                                  product![index].itemName, maxLines: 1,
                                                  style: TextStyle(
                                                    color: Color(0xFF344054), fontSize: 18, fontWeight: FontWeight.bold,
                                                    decoration: (product[index].totalCount == 0) ? TextDecoration.lineThrough : TextDecoration.none,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: GestureDetector(
                                                  child: CustomDelete(index: index),
                                                )
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            // "Card is a material design component that can be used to display content within a "
                                            //     "styled container. It typically has rounded corners and a subtle shadow to give "
                                            //     "it a raised appearance.",
                                            product[index].description,
                                            style: TextStyle(color: Color(0xFF344054), fontSize: 13, fontWeight: FontWeight.w500),
                                            maxLines: 3, overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomContainer(txt: "${product[index].price} Tk", fntSize: 13, fntWeight: FontWeight.w500, containerColor: Colors.black, containerWidth: 110, containerHeight: 30),
                                              //SizedBox(width: h / 15),
                                              CustomContainer(txt: "${product[index].discount}% Off", fntSize: 13, fntWeight: FontWeight.w500, containerColor: Color(0xff17A38F), containerWidth: 65, containerHeight: 30),
                                            ],
                                          ),
                                          SizedBox(height: 10)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
