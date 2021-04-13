import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final Pattern pattern;
  final bool isEnabled;
  final String customReg;
  final String customReg2;
  final int maxLength;
  final TextEditingController controller;

  final String errTxt;

  CustomTextField(
      {@required this.labelText,
      @required this.hintText,
      this.errTxt,
      this.pattern,
      this.customReg,
      this.customReg2,
      @required this.keyboardType,
      this.isEnabled = true,
      this.maxLength,
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
    if (widget.customReg == "TryOtherPattern") {
      if (RegVal.hasMatch(widget.controller.text, widget.pattern)) {
        setErrorState("");
      } else {
        setErrorState(widget.errTxt);
      }
    } else {
      if (widget.customReg2 != null) {
        if (RegExp(widget.customReg2).hasMatch(widget.controller.text) ||
            RegExp(widget.customReg).hasMatch(widget.controller.text)) {
          setErrorState("");
        } else {
          setErrorState(widget.errTxt);
        }
      } else {
        if (RegExp(widget.customReg).hasMatch(widget.controller.text)) {
          setErrorState("");
        } else {
          setErrorState(widget.errTxt);
        }
      }
    }

    if(!widget.isEnabled){
      print("run");
      int ageValue = int.parse(widget.controller.text);
      if(ageValue<=18 || ageValue >=35){
        setErrorState(widget.errTxt);
      }else{
        setErrorState("");
      }
    }
  }

  void setErrorState(String eText) {
    setState(() {
      errorText = eText;
    });
  }
}
