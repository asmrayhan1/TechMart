import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_mart/core/validation/validation.dart';

import '../../../core/extensions/image_path.dart';
import '../../../shared/buttons/custom_text_button.dart';
import '../../../shared/containers/custom_container.dart';
import '../../../shared/containers/custom_image.dart';
import '../../../shared/widget/utils/toast.dart';
import '../../profile/components/custom_field.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int _count = 0;
  String _brand = "", _item = "", _description = "", _price = "", _discount = "";
  bool isBrand = false, isItem = false, isDescription = false, isPrice = false, isDiscount = false, isCount = false, isImage = false;
  List<String> category = ["Laptop", "Pc", "Phone", "Tv", "Watch", "Headphone", "Gadget"];
  List<bool> isSelected = [false, false, false, false, false, false, false];
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _countController = TextEditingController();


  void _onCount(String count, BuildContext context){
    setState(() {
      bool status = Validation.countValidity(count: count, context: context);
      isCount = status;
      if (status) _count = int.parse(count);
    });
  }
  void _onBrand(String brand, BuildContext context){
    setState(() {
      _brand = brand;
      isBrand = Validation.brandValidity(brand: brand, context: context);
    });
  }
  void _onItem(String item, BuildContext context){
    setState(() {
      _item = item;
      isItem = Validation.itemValidity(item: item, context: context);
    });
  }
  void _onDescription(String description, BuildContext context){
    setState(() {
      _description = description;
      isDescription = Validation.descriptionValidity(description: description, context: context);
    });
  }
  void _onPrice(String price, BuildContext context){
    setState(() {
      _price = price;
      isPrice = Validation.priceValidity(price: price, context: context);
    });
  }
  void _onDiscount(String discount, BuildContext context){
    setState(() {
      _discount = discount;
      isDiscount = Validation.discountValidity(discount: discount, context: context);
    });
  }


  File? _image;

  // Function to pick an image
  Future<void> _pickImage() async {
    final picker = ImagePicker();

    // Pick image from gallery
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        isImage = true;

      });
    }
  }

  void _resetForm() {
    setState(() {
      _brand = _item = _description = _price = _discount = "";
      isBrand = isItem = isDescription = isPrice = isDiscount = false;
      isSelected = [false, false, false, false, false, false, false];
      _brandController.clear() ;_itemController.clear(); _descriptionController.clear(); _priceController.clear(); _discountController.clear(); _countController.clear();
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
              SizedBox(height: 30),

              // Display the picked image in a square container
              _image == null ? Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey[200], // Placeholder when no image is selected
                  child: Center(child: Text("No Image")),
                ),
              ) : Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover, // Ensure image covers the square box
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Custom Styled Button
              Center(
                child: ElevatedButton(
                  onPressed: _pickImage,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black), // Custom Color
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Slightly rounded corners
                    )),
                    padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 32, vertical: 5)), // Padding for the button
                  ),
                  child: Text("Pick Image", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              Text(" Brand", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _brandController, context: context, hintTxt: "Brand", onSubmittedValue: _onBrand)),
              SizedBox(height: 20),
              Text(" Item Name", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _itemController, context: context, hintTxt: "Item Name", onSubmittedValue: _onItem)),
              SizedBox(height: 20),
              Text(" Description", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              CustomField(maxLine: 10, controller: _descriptionController, context: context, hintTxt: "Description", onSubmittedValue: _onDescription),
              SizedBox(height: 20),
              Text(" Price", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _priceController, context: context, hintTxt: "Price", onSubmittedValue: _onPrice)),
              SizedBox(height: 20),
              Text(" Total available item", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _countController, context: context, hintTxt: "Total available item", onSubmittedValue: _onCount)),
              SizedBox(height: 20),
              Text(" Discount", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _discountController, context: context, hintTxt: "Discount", onSubmittedValue: _onDiscount)),
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
                    if (!isBrand) {
                      Toast.showToast(context: context, message: "invalid Brand Name!", isWarning: true);
                    } else if (!isImage){
                      Toast.showToast(context: context, message: "No Image Found!", isWarning: true);
                    } else if (!isItem){
                      Toast.showToast(context: context, message: "Invalid Item Name!", isWarning: true);
                    } else if (!isDescription){
                      Toast.showToast(context: context, message: "Invalid Description!", isWarning: true);
                    } else if (!isPrice){
                      Toast.showToast(context: context, message: "Invalid Price!", isWarning: true);
                    } else if (!isCount) {
                      Toast.showToast(context: context, message: "Invalid Total Count!", isWarning: true);
                    } else if (!isDiscount){
                      Toast.showToast(context: context, message: "Invalid Discount!", isWarning: true);
                    } else {
                      //
                      _resetForm();
                    }
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
