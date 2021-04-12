import 'package:flutter/material.dart';
import 'package:input_validation_excercise/pages/components/custom_text_field.dart';

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: CustomTextField(hintText: "Enter your email here",labelText: "Email",)
      ),
    );
  }
}