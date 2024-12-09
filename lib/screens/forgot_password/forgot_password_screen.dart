import 'package:shopay_flutter_eccommerce/screens/forgot_password/components/body.dart';
import 'package:flutter/material.dart';



class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}