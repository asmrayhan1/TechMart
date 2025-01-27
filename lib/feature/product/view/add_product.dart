import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/extensions/image_path.dart';
import '../../../shared/buttons/custom_text_button.dart';
import '../../../shared/containers/custom_container.dart';
import '../../../shared/containers/custom_image.dart';
import '../../../shared/text_field/custom_text_field.dart';
import '../../profile/components/custom_field.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _brand = "", _item = "", _description = "", _price = "", _discount = "";
  List<String> category = ["Laptop", "Pc", "Phone", "Tv", "Watch", "Headphone", "Gadget"];
  List<bool> isSelected = [false, false, false, false, false, false, false];
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();

  void _onBrand(String name){
    setState(() {
      _brand = name;
    });
  }
  void _onItem(String item){
    setState(() {
      _item = item;
    });
  }
  void _onDescription(String description){
    setState(() {
      _description = description;
    });
  }
  void _onPrice(String price){
    setState(() {
      _price = price;
    });
  }
  void _onDiscount(String discount){
    setState(() {
      _discount = discount;
    });
  }

  void _resetForm() {
    setState(() {
      _brand = _item = _description = _price = _discount = "";
      isSelected = [false, false, false, false, false, false, false];
      _brandController.clear() ;_itemController.clear(); _descriptionController.clear(); _priceController.clear(); _discountController.clear();
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" Category", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(category.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        for (int i = 0; i < category.length; i++){
                          setState(() {
                            if (i == index) {
                              isSelected[i] = true;
                            } else {
                              isSelected[i] = false;
                            }
                          });
                        }
                        if (kDebugMode) {
                          print("=================================");
                          print("Is Selected: ${isSelected[index]}");
                        }},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: CustomTextButton(
                          isSelected: isSelected[index],
                          title: category[index],
                        ),
                      ),
                    );
                  },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(" Brand", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _brandController, hintTxt: "Brand", onSubmittedValue: _onBrand)),
              SizedBox(height: 20),
              Text(" Item Name", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _itemController, hintTxt: "Item Name", onSubmittedValue: _onItem)),
              SizedBox(height: 20),
              Text(" Description", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              CustomField(maxLine: 10, controller: _descriptionController, hintTxt: "Description", onSubmittedValue: _onDescription),
              SizedBox(height: 20),
              Text(" Price", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _priceController, hintTxt: "Price", onSubmittedValue: _onPrice)),
              SizedBox(height: 20),
              Text(" Discount", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _discountController, hintTxt: "Discount", onSubmittedValue: _onDiscount)),
              SizedBox(height: 50),
              Center(
                child: GestureDetector(
                  onTap: (){
                    _resetForm();
                  },
                  child: CustomContainer(fntWeight: FontWeight.w600, fntSize: 16, txt: "Clear", containerColor: Colors.blueGrey, containerWidth: MediaQuery.of(context).size.width - 40, containerHeight: 50)
                )
              ),
              SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: (){

                  },
                  child: CustomContainer(fntWeight: FontWeight.w600, fntSize: 16, txt: "Add Product", containerColor: Color(0xff188273), containerWidth: MediaQuery.of(context).size.width - 40, containerHeight: 50)
                )
              ),
              SizedBox(height: 10),
            ],
          )
        ),
      ),
    );
  }
}
