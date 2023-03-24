import 'package:flutter/material.dart';

class BaseTextInput extends StatelessWidget {
  const BaseTextInput({
    Key? key,
    this.controller,
    this.labelText,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final Widget? labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        label: labelText,
      ),
    );
  }
}