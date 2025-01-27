import 'package:flutter/material.dart';
import 'package:tech_mart/feature/profile/components/custom_field.dart';
import 'package:tech_mart/shared/containers/custom_container.dart';

class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({super.key});

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {

  void _onName(String name){

  }
  void _onBio(String bio){

  }
  void _onPhone(String phone){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff2f4f7),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: (){
              //Navigator.of(context).pop();
            },
            child: Container(
              //margin: EdgeInsets.all(12.0),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Color(0xffc0c1ce)
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Icon(Icons.arrow_back, color: Colors.black, size: 15)),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xfff2f4f7),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" Name", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            CustomField(maxLine: 1, hintTxt: "Name", onSubmittedValue: _onName),
            SizedBox(height: 20),
            Text(" Bio", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            CustomField(maxLine: 1, hintTxt: "Bio", onSubmittedValue: _onBio),
            SizedBox(height: 20),
            Text(" Phone", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            CustomField(maxLine: 1, hintTxt: "Phone", onSubmittedValue: _onBio),
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
        ),
      ),
    );
  }
}
