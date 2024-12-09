
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'package:shopay_flutter_eccommerce/components/custom_navigation_bar.dart';
import 'package:shopay_flutter_eccommerce/routes.dart';
import 'package:shopay_flutter_eccommerce/screens/splash/splash_screen.dart';
import 'package:shopay_flutter_eccommerce/state_managements/auth_provider.dart';
import 'package:shopay_flutter_eccommerce/state_managements/cart_provider.dart';
import 'package:shopay_flutter_eccommerce/state_managements/favourite_provider.dart';
import 'package:shopay_flutter_eccommerce/state_managements/search_provider.dart';
import 'package:shopay_flutter_eccommerce/state_managements/theme_provider.dart';
import 'package:shopay_flutter_eccommerce/theme.dart';

// Entry point of the app with DevicePreview enabled only in debug mode
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => FavouriteProvider()),
          ChangeNotifierProvider(create: (context) => SearchProvider()), // Added SearchProvider here
        ],
        child: MainApp(isLoggedIn: isLoggedIn), // Pass login status to MainApp
      ),
    ),
  );
}

// MainApp widget to set up the theme, routes, and logic for login
class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedIn
              ? CustomNavigationBar.routeName
              : SplashScreen.routeName,
          theme: themeData(theme.isDarkMode),
          darkTheme: ThemeData.dark(),
          themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routes: routes,
          locale: DevicePreview.locale(context), // Set locale for DevicePreview
          builder: DevicePreview.appBuilder, // Wrap the app with DevicePreview
        );
      },
    );
  }
}
