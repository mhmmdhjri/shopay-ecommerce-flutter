import 'package:shopay_flutter_eccommerce/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}