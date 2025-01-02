import 'package:flutter/material.dart';

class StyledAddQrFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final int maxLines;
  final String? Function(String?) validator;
  const StyledAddQrFormField({super.key, required this.controller, this.placeholder, this.maxLines=1, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: placeholder,
        labelStyle: TextStyle(color: Color(0xff313131)),
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff313131)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      cursorColor: Colors.black,
      maxLines: maxLines,
      validator: (value) => validator(value)
    );
  }
}