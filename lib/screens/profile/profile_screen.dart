import 'package:shopay_flutter_eccommerce/screens/profile/components/body.dart';
import 'package:shopay_flutter_eccommerce/state_managements/auth_provider.dart';
import 'package:shopay_flutter_eccommerce/state_managements/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final authProvider = Provider.of<AuthProvider>(context); // Access AuthProvider
    return Scaffold(
      appBar: appBar(context),
      body: Body(email: authProvider.email,),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    forceMaterialTransparency: true,
    leading: Container(),
    centerTitle: true,
    title: Text(
      "Profile",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    actions: [
      Consumer<ThemeProvider>(
        builder: (context, theme, child) => IconButton(
          icon: Icon(
            theme.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            theme.toggleTheme(!theme.isDarkMode);
          },
        ),
      ),
    ],
  );
}