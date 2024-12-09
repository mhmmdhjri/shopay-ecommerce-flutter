import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/screens/favourite/favourite_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/home/home_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/profile/profile_screen.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomNavigationBar extends StatefulWidget {
  static String routeName = "/custom_navigation_bar";
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const FavouriteScreen(),
    const Text("Chat"),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kTextColor,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          _buildNavItem(
            iconPath: "assets/icons/Shop Icon.svg",
            label: "Home",
            index: 0,
          ),
          _buildNavItem(
            iconPath: "assets/icons/Heart Icon.svg",
            label: "Favorite",
            index: 1,
          ),
          _buildNavItem(
            iconPath: "assets/icons/Chat bubble Icon.svg",
            label: "Chat",
            index: 2,
          ),
          _buildNavItem(
            iconPath: "assets/icons/User Icon.svg",
            label: "Profile",
            index: 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        color: _selectedIndex == index ? kPrimaryColor : kTextColor,
      ),
      label: label,
    );
  }
}