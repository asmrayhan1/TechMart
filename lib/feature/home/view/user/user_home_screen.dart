import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/details/view/product_details_screen.dart';
import 'package:tech_mart/shared/buttons/custom_text_button.dart';
import 'package:tech_mart/shared/containers/custom_container.dart';
import 'package:tech_mart/shared/containers/custom_rating.dart';
import 'package:tech_mart/shared/model/category_model.dart';
import 'package:tech_mart/shared/popup_menu/custom_logout.dart';

import '../../../../core/extensions/image_path.dart';
import '../../../../shared/containers/custom_image.dart';
import '../../../auth/register/view/signup_screen.dart';
import '../../../product/view_model/product_controller.dart';
import '../../../profile/view_model/user_controller.dart';

class UserHomeScreen extends ConsumerStatefulWidget {
  const UserHomeScreen({super.key});

  @override
  ConsumerState<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends ConsumerState<UserHomeScreen> {
  List<bool> isSelected = [true, false, false, false, false, false, false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) async{
      try {
        await ref.read(userProvider.notifier).insertUser(
            email: insertEmail, name: insertName, phone: insertPhone);
      } catch(e){
        //
      }
        await ref.read(productProvider.notifier).productInitialize();
    });
  }
  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider).products;
    double h = MediaQuery.of(context).size.width - 20;
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
                            isSelected[i] = !isSelected[i];
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
                                SizedBox(
                                  height: h / 2.5,
                                  width: h / 2.3,
                                  child: Image.network("https://dkcsxccdmdunftexgdkc.supabase.co/storage/v1/object/public/${product?[index].image}", fit: BoxFit.cover),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: w,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 5, top: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product![index].itemName, maxLines: 1,
                                          style: TextStyle(
                                            color: Color(0xFF344054), fontSize: 18, fontWeight: FontWeight.bold,
                                            decoration: (product[index].totalCount == 0) ? TextDecoration.lineThrough : TextDecoration.none,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          product[index].description,
                                          style: TextStyle(color: Color(0xFF344054), fontSize: 13, fontWeight: FontWeight.w500),
                                          maxLines: 3, overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 8),
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
