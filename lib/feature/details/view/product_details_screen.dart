import 'package:flutter/material.dart';
import 'package:tech_mart/shared/containers/custom_container.dart';
import 'package:tech_mart/shared/containers/custom_image.dart';
import 'package:tech_mart/shared/containers/custom_rating.dart';

import '../../auth/login/view/login_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: Image.network("https://as01.epimg.net/img/especiales/futbol/2022/historias-futbolistas/players/lionel-messi/desktop/fotograma_2.jpg", fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Argentina Shirt",
                    style: TextStyle(color: Color(0xFF344054), fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  CustomRating(txt: "5"),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Brand: Adidas",
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
              Text("Using ListView.builder is a great way to handle large lists of dynamic content. It provides efficient memory management and allows you to build only "
                  "the visible widgets. In this example, we displayed a list of cards, but you can modify the layout and design as per your needs."
                "Let me know if you need further clarifications or additional features!", textAlign: TextAlign.justify),
              SizedBox(height: 15),
              Text(
                "Price: 2000 Taka",
                style: TextStyle(color: Color(0xFF101828), fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                "Discount: 30% Off",
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
              if (isAdmin != null && isAdmin == false) Center(child: CustomContainer(txt: "Order Now", fntSize: 16, fntWeight: FontWeight.bold, containerColor: Color(0xff188273), containerWidth: w + 10, containerHeight: 50))
            ],
          ),
        ),
      ),
    );
  }
}
