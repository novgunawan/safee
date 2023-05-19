import 'package:flutter/material.dart';
import 'package:safee/styles/style.dart';

class ValidationTextFormField extends StatelessWidget {
  const ValidationTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.alignment,
  });

  final TextEditingController controller;
  final String hintText;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryPurple,
      autocorrect: false,
      textAlign: alignment,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryGray),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        hintText: hintText,
        hintStyle: bodyRegularStyleGray,
      ),
    );
  }
}
