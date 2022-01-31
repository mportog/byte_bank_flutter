import 'package:flutter/material.dart';

class ContactTextFieldWidget extends StatelessWidget {
  const ContactTextFieldWidget(this.controller, this.label,
      {Key? key,
      this.textInputType = TextInputType.text,
      this.readOnly,
      this.obscureText})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType? textInputType;
  final bool? readOnly;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
        keyboardType: textInputType,
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false);
  }
}
