import 'package:flutter/material.dart';
import 'package:qim_center/pallete.dart';

class Field extends StatelessWidget {
  final String hintText;

  final icon;
  final input_type;
  final String? label;
  final String? hint;
  final int? maxlines;
  final Function()? onTap;
// قيمة بوليانية مشان كلمة السر لا تنسى
  final TextInputType? keyboaredtype;

  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const Field({
    Key? Key,
    required this.hintText,
    required this.icon,
    required this.input_type,
    key,
    this.label,
    this.hint,
    this.onTap,
    this.keyboaredtype,
    this.controller,
    this.validator,
    this.maxlines = 1,
  }) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.right,
        keyboardType: input_type,
        obscureText: true,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: Icon(
              icon,
              color: Pallete.borderColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.borderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Pallete.borderColor,
            )),
        maxLines: maxlines,
        onTap: onTap,
        validator: validator,
        controller: controller,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }
}
