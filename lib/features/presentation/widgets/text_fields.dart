import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_test/config/themes/theme_colors.dart';
import 'package:registration_test/config/themes/theme_text_style.dart';

class CommonCupertinoTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool withBorder;
  final bool obscureText;
  final String? Function(String?)? validator;
  const CommonCupertinoTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.withBorder = false,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<CommonCupertinoTextField> createState() => _CommonCupertinoTextFieldState();
}

class _CommonCupertinoTextFieldState extends State<CommonCupertinoTextField> {
  bool isObscureText = false;

  @override
  void initState() {
    isObscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      placeholder: widget.hintText,
      placeholderStyle: ThemeTextManropeRegular.cmSize.copyWith(
        color: ThemeColors.textGrey,
        fontSize: 16,
      ),
      textAlign: TextAlign.left,
      validator: widget.validator,
      controller: widget.controller,
      style: ThemeTextManropeRegular.cmSize.copyWith(
        color: ThemeColors.black,
        fontSize: 16,
      ),
      obscureText: isObscureText,
      // decoration: BoxDecoration(color: ThemeColors.formBg),
    );
  }
}
