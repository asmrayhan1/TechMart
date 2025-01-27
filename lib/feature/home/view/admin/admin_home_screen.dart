import 'package:flutter/material.dart';
import 'package:tech_mart/shared/popup_menu/custom_delete.dart';

import '../../../../core/extensions/image_path.dart';
import '../../../../shared/buttons/custom_text_button.dart';
import '../../../../shared/containers/custom_container.dart';
import '../../../../shared/containers/custom_image.dart';
import '../../../../shared/containers/custom_rating.dart';
import '../../../../shared/model/category_model.dart';
import '../../../../shared/popup_menu/custom_logout.dart';
import '../../../details/view/product_details_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  void _onProduct(int status){

  }

  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.width - 20) / 2;
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
                      ///
                    },
                    child: CustomTextButton(
                      title: categoryList[index].title,
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
                                    height: h,
                                    width: h,
                                    child: Image.network("https://as01.epimg.net/img/especiales/futbol/2022/historias-futbolistas/players/lionel-messi/desktop/fotograma_2.jpg", fit: BoxFit.cover),
                                  ),
                                  SizedBox(
                                    //color: Colors.red,
                                    width: h,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0, top: 15, right: 5),
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
                                                  "Argentina Shirt ddfsfsfsdfsdfsdfsfssdfsfasfsadfsdfsdfsfdsfsfsfsdfsdf", maxLines: 1,
                                                  style: TextStyle(color: Color(0xFF344054), fontSize: 18, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: GestureDetector(
                                                  child: CustomDelete(status: _onProduct),
                                                )
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Card is a material design component that can be used to display content within a "
                                                "styled container. It typically has rounded corners and a subtle shadow to give "
                                                "it a raised appearance.",

                                            style: TextStyle(color: Color(0xFF344054), fontSize: 14, fontWeight: FontWeight.w500),
                                            maxLines: 3, overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomContainer(txt: "200 Taka", fntSize: 14, fntWeight: FontWeight.w500, containerColor: Colors.black, containerWidth: 100, containerHeight: 30),
                                              //SizedBox(width: h / 15),
                                              CustomContainer(txt: "30% Off", fntSize: 14, fntWeight: FontWeight.w500, containerColor: Color(0xff17A38F), containerWidth: 70, containerHeight: 30),
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
