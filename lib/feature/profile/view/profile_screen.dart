import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/profile/view/edit_info_screen.dart';
import 'package:tech_mart/shared/popup_menu/custom_change_image.dart';
import '../../../core/extensions/image_path.dart';
import '../../../shared/containers/custom_image.dart';
import '../view_model/user_controller.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      ref.read(userProvider.notifier).userInitialize();
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).users;
    final status = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: Color(0xfff2f4f5), // or 0xfff2f4f7,
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
            child: CustomChangeImage(),
          )
        ],
      ),
      body: user == null? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  user.imgUrl!.isEmpty ? Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey[200], // Placeholder when no image is selected
                    child: Center(child: Text("No Image")),
                    ) : CircleAvatar(
                    radius: 57.5,
                    child: ClipOval(
                      child: Image.network(
                        fit: BoxFit.cover,
                        height: 130,
                        width: 135,
                        "https://dkcsxccdmdunftexgdkc.supabase.co/storage/v1/object/public/${user.imgUrl}",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${user.name}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101828),
                    ),
                  ),
                  Text(
                    "${user.bio}",
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
              child: Padding(
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
                      "See ${user.name}'s Calender",
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
                        Text("${user.name}", maxLines: 2,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditInfoScreen()));
                          },
                          child: Icon(Icons.settings)
                        ),
                      ],
                    ),
                    //const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        children: [
                          Text("${user.bio}", maxLines: 3,
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
                          Text("Phone: ${user.phone}", maxLines: 2,
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
                          Text("Email: ${user.email}", maxLines: 2,
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
                          Text("Address: ${user.address}",
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
