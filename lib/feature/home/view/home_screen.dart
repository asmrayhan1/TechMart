import 'package:flutter/material.dart';
import 'package:tech_mart/shared/containers/custom_container.dart';
import 'package:tech_mart/shared/containers/custom_rating.dart';
import 'package:tech_mart/shared/popup_menu/custom_logout.dart';

import '../../../core/extensions/image_path.dart';
import '../../../shared/containers/custom_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.width - 70) / 2;
    return Scaffold(
      backgroundColor: Colors.white, // Color(0xffe2e6e6),
      appBar: AppBar(
        backgroundColor: Colors.white, //Color(0xffe2e6e6),
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
                onTap: (){
                  // Navigator.pushReplacement(
                  //     context, MaterialPageRoute(builder: (context)=>LoginScreen())
                  // );
                },
                child: CustomLogout(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),  // Rounded corners
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: h + 20,
                          width: h,
                          child: Image.network("https://as01.epimg.net/img/especiales/futbol/2022/historias-futbolistas/players/lionel-messi/desktop/fotograma_2.jpg", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 15),
                        Container(
                          //color: Colors.red,
                          width: h + 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              CustomRating(txt: "6"),
                              SizedBox(height: 8),
                              Text(
                                "Argentina Shirt",
                                style: TextStyle(color: Color(0xFF344054), fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Card is a material design component that can be used to display content within a "
                                    "styled container. It typically has rounded corners and a subtle shadow to give "
                                    "it a raised appearance.",

                                style: TextStyle(color: Color(0xFF344054), fontSize: 14, fontWeight: FontWeight.w500),
                                maxLines: 3, overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  CustomContainer(txt: "200 Taka", fntSize: 14, fntWeight: FontWeight.w500, containerColor: Colors.orange, containerWidth: 80, containerHeight: 35),
                                  SizedBox(width: h / 15),
                                  CustomContainer(txt: "30% Off", fntSize: 14, fntWeight: FontWeight.w500, containerColor: Colors.orange, containerWidth: 80, containerHeight: 35),
                                ],
                              ),
                              SizedBox(height: 10)
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
