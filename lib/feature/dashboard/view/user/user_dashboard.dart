import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_mart/core/extensions/image_path.dart';
import 'package:tech_mart/feature/home/view/admin/admin_home_screen.dart';
import 'package:tech_mart/feature/home/view/user/user_home_screen.dart';
import 'package:tech_mart/feature/product/view/add_product.dart';
import 'package:tech_mart/feature/profile/view/profile_screen.dart';
import 'package:tech_mart/feature/shop/view/admin/admin_shop_screen.dart';
import 'package:tech_mart/feature/shop/view/user/user_shop_screen.dart';
import 'package:tech_mart/shared/containers/custom_image.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (kDebugMode) {
        print("index = $index");
      }
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    UserHomeScreen(),
    UserShopScreen(),
    ProfileScreen()
  ];

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,//Color(0xFFF2F6FB),
      body: RefreshIndicator(
          onRefresh: _refreshData, backgroundColor: Color(0xFFF2F6FB),
          child: _widgetOptions.elementAt(_selectedIndex)
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // This will keep track of the selected index
        onTap: (int index){
          _onItemTapped(index);
        }, // Function to handle tap events
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffF2F6FB), //Color(0xff17a38f),
        selectedItemColor: Color(0xff17a38f), //Colors.white,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          color: Color(0xff105866),  // Change text color for the selected label
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person, size: 25),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
