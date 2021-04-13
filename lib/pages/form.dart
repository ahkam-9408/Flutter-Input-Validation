import 'package:flutter/material.dart';
import 'package:input_validation_excercise/pages/components/custom_sized_box.dart';
import 'package:input_validation_excercise/pages/components/custom_text_field.dart';
import 'package:regexpattern/regexpattern.dart';

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String errorFirstName = "Please Enter Valid First Name";
  String errorLastName = "Please Enter Valid Last Name";
  String errorNIC = "Please Enter Valid NIC Number";
  String errorMobileNumber = "Please Enter Valid Mobile Number";
  String errorAddress = "Please Enter Address";

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: screenWidth,
            height: screenHeight,
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
                  height: 30,
                ),
                CustomTextField(
                  hintText: "Enter your first name here",
                  labelText: "First Name",
                  errTxt: errorFirstName,
                  keyboardType: TextInputType.name,
                  customReg: r"^(?![\s.]+$)[a-zA-Z\s.]*$",
                ),
                CustomSizedBox(),
                CustomTextField(
                    hintText: "Enter your last name here",
                    labelText: "Last Name",
                    errTxt: errorLastName,
                    keyboardType: TextInputType.name,
                    customReg: r"^(?![\s.]+$)[a-zA-Z\s.]*$"),
                CustomSizedBox(),
                CustomTextField(
                    hintText: "Enter your birthday here",
                    labelText: "Birthday",
                    errTxt: errorLastName,
                    keyboardType: TextInputType.datetime,
                    pattern: RegexPattern.basicDateTime),
                CustomSizedBox(),
                CustomTextField(
                  hintText: "Enter your age here",
                  labelText: "Age",
                  errTxt: errorLastName,
                  keyboardType: TextInputType.name,
                  pattern: RegexPattern.alphabetOnly,
                  isEnabled: false,
                ),
                CustomSizedBox(),
                CustomTextField(
                  hintText: "Enter your Number here",
                  labelText: "NIC",
                  errTxt: errorNIC,
                  keyboardType: TextInputType.text,
                  customReg: r"^[0-9]{9}[A-Z]{1}$",
                  customReg2: r"^[0-9]{12}$",
                  maxLength: 12,
                ),
                CustomSizedBox(),
                CustomTextField(
                    hintText: "Enter your mobile number here",
                    labelText: "Mobile Number",
                    errTxt: errorMobileNumber,
                    keyboardType: TextInputType.phone,
                    maxLength:10,
                    pattern: RegexPattern.numericOnly,
                    customReg: "TryOtherPattern",
                ),
                CustomSizedBox(),
                CustomTextField(
                    hintText: "Enter your address here",
                    labelText: "Address",
                    errTxt: errorAddress,
                    keyboardType: TextInputType.streetAddress,
                    customReg: r"^[a-zA-Z0-9\s,.'-]{3,}$",
                ),
                CustomSizedBox(),
                CustomTextField(
                    hintText: "Enter your address here",
                    labelText: "School or University",
                    errTxt: errorAddress,
                    keyboardType: TextInputType.streetAddress,
                    customReg: r"^[a-zA-Z0-9\s,.'-]{3,}$",
                ),
              ],
            )),
      ),
    );
  }
}
