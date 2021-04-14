import 'package:flutter/material.dart';
import 'package:input_validation_excercise/global variable/global.dart'
    as global;
import 'package:input_validation_excercise/assets/constants.dart' as Constants;

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  final String uniqueName;
  final String customReg;
  final String customReg2;
  final String errTxt;

  final bool isEnabled;
  final bool isGrey;
  final int maxLength;

  CustomTextField({
    @required this.labelText,
    @required this.hintText,
    @required this.keyboardType,
    @required this.controller,
    this.uniqueName,
    this.customReg,
    this.customReg2,
    this.errTxt,
    this.isEnabled = true,
    this.isGrey = false,
    this.maxLength,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      onChanged: onChange,
      enabled: widget.isEnabled,
      maxLength: widget.maxLength,
      style:
          TextStyle(color: widget.isGrey == true ? Colors.grey : Colors.black),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText: errorText == "" ? null : errorText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }

  void onChange(value) {
    if (widget.customReg2 != null) {
      if (RegExp(widget.customReg2).hasMatch(widget.controller.text) ||
          RegExp(widget.customReg).hasMatch(widget.controller.text)) {
        setErrorState("");
        setFormValidState(true);
      } else {
        setErrorState(widget.errTxt);
        setFormValidState(false);
      }
    } else {
      if (RegExp(widget.customReg).hasMatch(widget.controller.text)) {
        setErrorState("");
        setFormValidState(true);
      } else {
        setErrorState(widget.errTxt);
        setFormValidState(false);
      }
    }
  }

  void setErrorState(String eText) {
    setState(() {
      errorText = eText;
    });
  }

  void setFormValidState(bool state) {
    if (widget.uniqueName == Constants.FIRST_NAME) {
      global.isValidFirstName = state;
    } else if (widget.uniqueName == Constants.LAST_NAME) {
      global.isValidLastName = state;
    } else if (widget.uniqueName == Constants.NIC) {
      global.isValidNIC = state;
    } else if (widget.uniqueName == Constants.MOBILE_NUMBER) {
      global.isValidMobileNumber = state;
    } else if (widget.uniqueName == Constants.ADDRESS) {
      global.isValidAddress = state;
    } else if (widget.uniqueName == Constants.SCHOOL) {
      global.isValidSchool = state;
    }
  }
}
