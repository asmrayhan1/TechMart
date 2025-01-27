import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/image_path.dart';
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

  void _onName(String name){

  }
  void _onBio(String bio){

  }
  void _onPhone(String phone){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f4f7),
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
              Text(" Name", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, hintTxt: "Name", onSubmittedValue: _onName)),
              SizedBox(height: 20),
              Text(" Bio", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, hintTxt: "Bio", onSubmittedValue: _onBio)),
              SizedBox(height: 20),
              Text(" Phone", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              SizedBox(height: 50, child: CustomField(maxLine: 1, hintTxt: "Phone", onSubmittedValue: _onBio)),
              SizedBox(height: 40),
              Center(
                  child: GestureDetector(
                      onTap: (){
                        // Code here
                      },
                      child: CustomContainer(fntWeight: FontWeight.w600, fntSize: 16, txt: "Save", containerColor: Color(0xff188273), containerWidth: MediaQuery.of(context).size.width - 60, containerHeight: 50)
                  )
              ),
            ],
          )
        ),
      ),
    );
  }
}
