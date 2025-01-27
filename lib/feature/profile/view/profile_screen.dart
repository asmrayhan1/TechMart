import 'package:flutter/material.dart';
import 'package:tech_mart/shared/popup_menu/custom_change_image.dart';
import 'package:tech_mart/shared/popup_menu/custom_edit_info.dart';

import '../../../core/extensions/image_path.dart';
import '../../../shared/containers/custom_image.dart';
import '../../../shared/popup_menu/custom_logout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f4f7), //Colors.white,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (context)=>LoginScreen())
                // );
              },
              child: CustomChangeImage(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 57.5,
                    child: ClipOval(
                      child: Image.network(
                        fit: BoxFit.cover,
                        height: 115,
                        width: 115,
                        "https://as01.epimg.net/img/especiales/futbol/2022/historias-futbolistas/players/lionel-messi/desktop/fotograma_2.jpg",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Musaddek Ali",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101828),
                    ),
                  ),
                  const Text(
                    "Senior front end Developer",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF344054),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFF188273),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 23,
                  vertical: 9,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 12),
                    Text(
                      "See Musaddek's Calender",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF101828),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFF188273),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15, right: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("title",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                        GestureDetector(
                          onTap: () {},
                          child: CustomEditInfo(),
                        ),
                      ],
                    ),
                    //const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        children: [
                          Text("description",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF344054))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        children: [
                          Text("Phone: 01312345678",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF344054))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        children: [
                          Text("Email: abcd@gmail.com",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF344054))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
