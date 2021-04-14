import 'package:flutter/material.dart';
import 'package:input_validation_excercise/global variable/global.dart' as global;
import 'package:input_validation_excercise/assets/constants.dart' as Constants;

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool isEnabled;
  final String customReg;
  final String customReg2;
  final int maxLength;
  final TextEditingController controller;
  final bool isGrey;
  final String uniqueName;

  final String errTxt;

  CustomTextField(
      {@required this.labelText,
      @required this.hintText,
      this.errTxt,
      this.customReg,
      this.customReg2,
      @required this.keyboardType,
      this.isEnabled = true,
      this.maxLength,
      this.isGrey = false,
      this.uniqueName,
      @required this.controller});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String errorText = "";

  // final controller = TextEditingController();

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
        errorText: errorText == "" ? null : errorText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red)),
        labelText: widget.labelText,
        hintText: widget.hintText,
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

  void setFormValidState(bool state){
    if(widget.uniqueName == Constants.FIRST_NAME){
      global.isValidFirstName = state;
      print(global.isValidFirstName);
    }else if(widget.uniqueName == Constants.LAST_NAME){
      global.isValidLastName = state;
      print(global.isValidLastName);
    }else if(widget.uniqueName == Constants.NIC){
      global.isValidNIC = state;
      print(global.isValidNIC);
    }else if(widget.uniqueName == Constants.MOBILE_NUMBER){
      global.isValidMobileNumber = state;
      print(global.isValidMobileNumber);
    }else if(widget.uniqueName == Constants.ADDRESS){
      global.isValidAddress = state;
      print(global.isValidAddress);
    }else if(widget.uniqueName == Constants.SCHOOL){
      global.isValidSchool = state;
      print(global.isValidSchool);
    }
  }
}
