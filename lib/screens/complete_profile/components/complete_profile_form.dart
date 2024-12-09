import 'package:shopay_flutter_eccommerce/components/custom_suffix_icon.dart';
import 'package:shopay_flutter_eccommerce/components/error_form.dart';
import 'package:shopay_flutter_eccommerce/components/my_default_button.dart';
import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/screens/otp/otp_screen.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';


class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  String? firstName;
  String? lastName;  
  String? phoneNumber;  
  String? address;  

  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          firstNameFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          lastNameFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          phoneNumberFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          addressFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          ErrorForm(errors: errors),
          SizedBox(height: getPropScreenHeight(20)),
          MyDefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }

              if (errors.isEmpty) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            }
          ),
        ]
      ),
    );
  }

  TextFormField addressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kAddressNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kAddressNullError)) {
          setState(() {
            errors.add(kAddressNullError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
          hintText: "Your address here",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            icon: "assets/icons/Location point.svg",
          )
      ),
    );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
        onSaved: (newValue) => phoneNumber = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
            setState(() {
              errors.remove(kPhoneNumberNullError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
            setState(() {
              errors.add(kPhoneNumberNullError);
            });
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            labelText: "Phone Number",
            hintText: "Your phone number here",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              icon: "assets/icons/Phone.svg",
            )
          ),
        );
  }

  TextFormField lastNameFormField() {
    return TextFormField(
        onSaved: (newValue) => lastName = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNameNullError)) {
            setState(() {
              errors.remove(kNameNullError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
            labelText: "Last Name",
            hintText: "Your last name here",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              icon: "assets/icons/User.svg",
            )
          ),
        );
  }

  TextFormField firstNameFormField() {
    return TextFormField(
        onSaved: (newValue) => firstName = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNameNullError)) {
            setState(() {
              errors.remove(kNameNullError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
            labelText: "First Name",
            hintText: "Your first name here",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              icon: "assets/icons/User.svg",
            )
          ),
        );
  }
}