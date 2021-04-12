import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;

  final String errTxt;

  const CustomTextField({this.labelText, this.hintText, this.errTxt});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          errorText: errTxt,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: errTxt != null
                  ? BorderSide(color: Colors.red, width: 5)
                  : null),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red)),
          labelText: labelText,
          hintText: hintText),
    );
  }
}
