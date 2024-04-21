import 'package:flutter/material.dart';
import 'package:graduationproject/constants.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.onSave,
    this.controller,
    this.onChange,
    this.onSubmitted,
    this.secure = false,
    this.focusNode,
    this.onEditingComplete,
    this.textInputAction,
    this.enable = true,
    this.keyBoardType,
  });
  final bool secure;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSave;
  final void Function(String)? onChange;
  final void Function(String?)? onSubmitted;
  final FocusNode? focusNode;
  final bool? enable;
  final TextInputType? keyBoardType;

  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadiusDirectional.circular(4),
      child: TextFormField(
        keyboardType: keyBoardType,
        obscureText: secure,
        enabled: enable,
        onSaved: onSave,
        onFieldSubmitted: onSubmitted,
        onChanged: onChange,
        controller: controller,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: grey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: white,
            ),
          ),
          enabledBorder: inputBorder(white),
          focusedBorder: inputBorder(primaryAppColor),
          errorBorder: inputBorder(error),
          focusedErrorBorder: inputBorder(error),
          disabledBorder: inputBorder(white),
        ),
      ),
    );
  }
}

InputBorder inputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: BorderSide(color: color),
  );
}