import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_mart/feature/product/view_model/product_controller.dart';
import '../../../core/validation/validation.dart';
import '../../../shared/buttons/custom_text_button.dart';
import '../../../shared/containers/custom_container.dart';
import '../../../shared/widget/utils/toast.dart';
import '../../profile/components/custom_field.dart';

class UpdateProduct extends ConsumerStatefulWidget {
  final int index;
  const UpdateProduct({super.key, required this.index});

  @override
  ConsumerState<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends ConsumerState<UpdateProduct> {
  int _count = 0, _index = -1, id = 0;
  String _brand = "", _item = "", _description = "", _price = "", _discount = "", img = "";
  bool isBrand = true, isItem = true, isDescription = true, isPrice = true, isDiscount = true, isCount = true, isImage = true;
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
      _brandController.clear() ;_itemController.clear(); _descriptionController.clear(); _priceController.clear(); _discountController.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      final product = ref.watch(productProvider).products?[widget.index];
      _brand = product!.brand; img = product.image; _item = product.itemName; _description = product.description; _price = product.price.toString(); _discount = product.discount.toString();
      _brandController.text = product.brand; _itemController.text = product.itemName; _descriptionController.text = product.description; _priceController.text = product.price.toString();
      _discountController.text = product.discount.toString(); _countController.text = product.totalCount.toString();
      for (int i = 0; i < category.length; i++){
        if (product.category == category[i]){
          setState(() {
            _index = i;
          });
          break;
        }
      }
      id = product.id!;
      Future.delayed(Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FB),
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
      backgroundColor: Color(0xfff2f4f7),
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
                                _index = index;
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

                _image == null ? Center(
                  child: SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: ClipRRect(
                      child: Image.network(
                        "https://dkcsxccdmdunftexgdkc.supabase.co/storage/v1/object/public/$img",
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  )
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
                Text(" Total Item", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _priceController, context: context, hintTxt: "Total Item", onSubmittedValue: _onCount)),
                SizedBox(height: 20),
                Text(" Discount", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                SizedBox(height: 50, child: CustomField(maxLine: 1, controller: _discountController, context: context, hintTxt: "Discount", onSubmittedValue: _onDiscount)),
                SizedBox(height: 50),
                Center(
                    child: GestureDetector(
                        onTap: () async {
                          if (!isBrand) {
                            Toast.showToast(context: context, message: "invalid Brand Name!", isWarning: true);
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
                            bool isUpdate = await ref.read(productProvider.notifier).updateProduct(
                                id: id, category: category[_index], brand: _brand, itemName: _item, imgFile: _image, img: img,
                                description: _description, price: int.parse(_price), totalCount: _count, discount: int.parse(_discount)
                            );
                            if (isUpdate){
                              Toast.showToast(context: context, message: "Updated Successfully");
                            } else {
                              Toast.showToast(context: context, message: "Server Error!", isWarning: true);
                            }
                          }
                        },
                        child:  CustomContainer(status: ref.watch(productProvider).isLoading? true : false, fntWeight: FontWeight.w600, fntSize: 16, txt: "Update Product", containerColor: Color(0xff188273), containerWidth: MediaQuery.of(context).size.width - 40, containerHeight: 50)
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
