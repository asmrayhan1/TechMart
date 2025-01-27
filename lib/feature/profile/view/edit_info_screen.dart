import 'package:flutter/material.dart';
import 'package:tech_mart/feature/profile/components/custom_field.dart';
import 'package:tech_mart/shared/containers/custom_container.dart';

class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({super.key});

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String _name = "", _bio = "", _phone = "";
  void _onName(String name){
    setState(() {
      _name = name;
    });
  }
  void _onBio(String bio){
    setState(() {
      _bio = bio;
    });
  }
  void _onPhone(String phone){
    setState(() {
      _phone = phone;
    });
  }
  void _resetForm(){
    setState(() {
      _name = _bio = _phone = "";
       _nameController.clear(); _bioController.clear(); _phoneController.clear();
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
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(" Name", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              CustomField(maxLine: 1, controller: _nameController, hintTxt: "Name", onSubmittedValue: _onName),
              SizedBox(height: 20),
              Text(" Bio", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              CustomField(maxLine: 1, controller: _bioController, hintTxt: "Bio", onSubmittedValue: _onBio),
              SizedBox(height: 20),
              Text(" Phone", style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              CustomField(maxLine: 1, controller: _phoneController, hintTxt: "Phone", onSubmittedValue: _onPhone),
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
                        _resetForm();
                      },
                      child: CustomContainer(fntWeight: FontWeight.w600, fntSize: 16, txt: "Save", containerColor: Color(0xff188273), containerWidth: MediaQuery.of(context).size.width - 40, containerHeight: 50)
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
