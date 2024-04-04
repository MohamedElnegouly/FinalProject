
import 'package:flutter/material.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomInputField(
      {Key? key,
         this.hintText='',
        this.suffixIcon = false,
        this.isDense,
        this.obscureText = false,
        this.controller,
        this.labelText='',
      })
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Column(
        children: [
          TextFormField(
            obscureText: (widget.obscureText && _obscureText),
            decoration:
            InputDecoration(
              border : OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.sp),
                      borderSide:
                      BorderSide(color: mainColor)
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
              isDense: (widget.isDense != null) ? widget.isDense : false,
              hintText: widget.hintText,
              labelText: widget.labelText,
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.remove_red_eye
                      : Icons.visibility_off_outlined,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
                  : null,
              suffixIconConstraints: (widget.isDense != null)
                  ?  BoxConstraints(maxHeight: 33.sp)
                  : null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator:
                (textValue) {
              if (textValue == null || textValue.isEmpty) {
                return 'required!';
              }
              return null;
            },
            controller: widget.controller,
          ),
        ],
    );
  }
}
