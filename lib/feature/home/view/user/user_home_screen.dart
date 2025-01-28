import 'package:flutter/material.dart';
import 'package:tech_mart/feature/details/view/product_details_screen.dart';
import 'package:tech_mart/shared/buttons/custom_text_button.dart';
import 'package:tech_mart/shared/containers/custom_container.dart';
import 'package:tech_mart/shared/containers/custom_rating.dart';
import 'package:tech_mart/shared/model/category_model.dart';
import 'package:tech_mart/shared/popup_menu/custom_logout.dart';

import '../../../../core/extensions/image_path.dart';
import '../../../../shared/containers/custom_image.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  List<bool> isSelected = [false, false, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.width - 20;
    double w = h - h / 2.15;
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
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
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
                                  height: h / 2.7,
                                  width: h / 2.15,
                                  child: Image.network("https://as01.epimg.net/img/especiales/futbol/2022/historias-futbolistas/players/lionel-messi/desktop/fotograma_2.jpg", fit: BoxFit.cover),
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
                                          "Argentina Shirt", maxLines: 1,
                                          style: TextStyle(color: Color(0xFF344054), fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Card is a material design component that can be used to display content within a "
                                              "styled container. It typically has rounded corners and a subtle shadow to give "
                                              "it a raised appearance.",

                                          style: TextStyle(color: Color(0xFF344054), fontSize: 13, fontWeight: FontWeight.w500),
                                          maxLines: 3, overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomContainer(txt: "2000 Tk", fntSize: 13, fntWeight: FontWeight.w500, containerColor: Colors.black, containerWidth: 110, containerHeight: 30),
                                            //SizedBox(width: h / 15),
                                            CustomContainer(txt: "30% Off", fntSize: 13, fntWeight: FontWeight.w500, containerColor: Color(0xff17A38F), containerWidth: 65, containerHeight: 30),
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
