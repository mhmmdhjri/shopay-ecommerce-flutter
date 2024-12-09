import 'package:shopay_flutter_eccommerce/components/custom_suffix_icon.dart';
import 'package:shopay_flutter_eccommerce/components/error_form.dart';
import 'package:shopay_flutter_eccommerce/components/my_default_button.dart';
import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/login_success/login_success_screen.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:shopay_flutter_eccommerce/state_managements/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _frontKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final List<String> errors = [];

  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _frontKey,
        child: Column(
          children: [
            // email field
            emailFormField(),
            SizedBox(height: getPropScreenHeight(30)),
            // password field
            passwordFormField(),
            SizedBox(height: getPropScreenHeight(30)),
            rememberAndForgot(),
            SizedBox(height: getPropScreenHeight(20)),
            ErrorForm(errors: errors),
            SizedBox(height: getPropScreenHeight(20)),
            MyDefaultButton(
              text: "Sign In",
              press: () {
                if (_frontKey.currentState!.validate()) {
                  _frontKey.currentState!.save();
                }

                if (errors.isEmpty) {
                  final authProvider = Provider.of<AuthProvider>(context, listen: false);
                  authProvider.setAuth(true);
                  
                  if (email != null) {
                    authProvider.setEmail(email!); // Store email
                  }
                  
                  if (password != null) {
                    authProvider.setPassword(password!); // Store password (if needed)
                  }

                  Navigator.pushNamedAndRemoveUntil(context, LoginSuccessScreen.routeName,
                    (Route<dynamic> route) => false);
                }
              }
            )
          ],
        ));
  }

  Row rememberAndForgot() {
    return Row(
                children: [
                  Checkbox(
                    value: remember,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    },
                    activeColor: kPrimaryColor,
                  ),
                  const Text("Remember Me"),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                    },
                    child: const Text(
                      "Forgot Password", style: TextStyle(
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ],
              );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        }  else if (value.length < 8 && (!errors.contains(kShortPassError) && !errors.contains(kPassNullError))) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Your password here",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            icon: "assets/icons/Lock.svg",
          )),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) && (!errors.contains(kPassNullError) && !errors.contains(kInvalidEmailError))) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Your email here",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            icon: "assets/icons/Mail.svg",
          )),
    );
  }
}
