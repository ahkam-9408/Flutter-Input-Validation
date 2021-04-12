import 'package:flutter/material.dart';
import 'package:input_validation_excercise/pages/components/custom_sized_box.dart';
import 'package:input_validation_excercise/pages/components/custom_text_field.dart';

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String errorFirstName = "Error";
  String errorLastName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Student Registration",
                style: TextStyle(
                  color: Color(0xff48a572),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Enter your first name here",
                labelText: "First Name",
                errTxt: errorFirstName,
              ),
              CustomSizedBox(),
              CustomTextField(
                hintText: "Enter your last name here",
                labelText: "Last Name",
                errTxt: errorLastName,
              ),
              CustomSizedBox(),
            ],
          )),
    );
  }
}
