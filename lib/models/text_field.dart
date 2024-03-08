
import 'package:flutter/material.dart';
import 'package:graduationproject/colors/colors.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final icon;
  final suffixIcon;
  final type;
  final validator;

   MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.icon,
    this.suffixIcon,
    this.type,
     this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border : OutlineInputBorder(
            borderSide: BorderSide(color: mainColor)
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          suffix: suffixIcon,
            icon: icon,
            hintStyle: TextStyle(color: Colors.grey[500])
        ),
        validator: validator,
        );

    //   TextFormField(
    //   controller: controller,
    //   obscureText: obscureText,
    //   decoration: InputDecoration(
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.white),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.grey.shade400),
    //       ),
    //       fillColor: Colors.grey.shade200,
    //       filled: true,
    //       hintText: hintText,
    //       suffix: suffixIcon,
    //       icon: icon,
    //       hintStyle: TextStyle(color: Colors.grey[500])),
    // );
  }
}
