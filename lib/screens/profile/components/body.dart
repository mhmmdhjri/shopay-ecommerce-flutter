import 'package:shopay_flutter_eccommerce/screens/profile/components/item_button_profile.dart';
import 'package:shopay_flutter_eccommerce/screens/profile/components/porfile_picture.dart';
import 'package:shopay_flutter_eccommerce/screens/sign_in/sign_in_screen.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:shopay_flutter_eccommerce/state_managements/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Body extends StatelessWidget {
   final String email;
  const Body({
    super.key, required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
          const PorfilePicture(),
          SizedBox(
            height: getPropScreenWidth(20),
          ),
          Text(
            '$email',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
          ),
          ItemButtonProfile(
            title: 'My Account',
            svgIcon: 'assets/icons/User Icon.svg',
            press: () {}, 
          ),
          ItemButtonProfile(
            title: 'Notifications',
            svgIcon: 'assets/icons/Bell.svg',
            press: () {},
            
          ),
          ItemButtonProfile(
            title: 'Settings',
            svgIcon: 'assets/icons/Settings.svg',
            press: () {}, 
            
          ),
          ItemButtonProfile(
            title: 'Question',
            svgIcon: 'assets/icons/Question mark.svg',
            press: () {}, 
            
          ),
          ItemButtonProfile(
            title: 'Log Out',
            svgIcon: 'assets/icons/Log out.svg',
            press: () {
               Provider.of<AuthProvider>(context, listen: false).setAuth(false);
                Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName,
                    (Route<dynamic> route) => false);
            }, 
            
          ),
        ],
      );
  }
}
