import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              CustomImage(
                height: 30,
                width: 30,
                imagePath: ImagePath.app_logo,
              ),
              Text("TechMart", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xff17a38f)),),
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
        child: Column(
          children: [
        
          ],
        ),
      ),
    );
  }
}
