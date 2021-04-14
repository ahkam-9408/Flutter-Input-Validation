import 'package:flutter/material.dart';
import 'package:input_validation_excercise/pages/components/custom_sized_box.dart';
import 'package:input_validation_excercise/pages/components/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:input_validation_excercise/global variable/global.dart'
    as global;
import 'package:input_validation_excercise/assets/constants.dart' as Constants;

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

enum Gender { male, female }

class _FormPageState extends State<FormPage> {
  String errorFirstName = "Please Enter Valid First Name";
  String errorLastName = "Please Enter Valid Last Name";
  String errorAge = "Sorry! Age should between 18-35 years";
  String errorNIC = "Please Enter Valid NIC Number";
  String errorMobileNumber = "Please Enter Valid Mobile Number";
  String errorAddress = "Please Enter Valid Address";
  String errorSchool = "Please Enter Valid School or University";

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final nicController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final addressController = TextEditingController();
  final schoolController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  int difference = 0;

  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    "Student Registration",
                    style: TextStyle(
                      color: Color(0xff48a572),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
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
                  controller: firstNameController,
                  uniqueName: Constants.FIRST_NAME,
                ),
                CustomSizedBox(),
                CustomTextField(
                  hintText: "Enter your last name here",
                  labelText: "Last Name",
                  errTxt: errorLastName,
                  keyboardType: TextInputType.name,
                  customReg: r"^(?![\s.]+$)[a-zA-Z\s.]*$",
                  controller: lastNameController,
                  uniqueName: Constants.LAST_NAME,
                ),
                CustomSizedBox(),
                Text(
                  "Date of Birth",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 7 * 3,
                      height: 45,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () => _selectDate(context), // Refer step 3
                        child: Text(
                          'Select Date',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(DateFormat('yyyy-MM-dd')
                        .format(selectedDate)
                        .toString())
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                difference >= 18 && difference <= 35
                    ? Text("")
                    : Text(
                        "Sorry! Age should between 18-35 years",
                        style: TextStyle(color: Colors.red),
                      ),
                CustomSizedBox(),
                CustomTextField(
                  hintText: "Enter your age here",
                  labelText: "Age",
                  errTxt: errorAge,
                  keyboardType: TextInputType.name,
                  isEnabled: false,
                  controller: ageController,
                  isGrey: true,
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
                  controller: nicController,
                  uniqueName: Constants.NIC,
                ),
                CustomSizedBox(),
                CustomTextField(
                  hintText: "Enter your mobile number here",
                  labelText: "Mobile Number",
                  errTxt: errorMobileNumber,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  customReg: r"^[0-9]{10}$",
                  controller: mobileNumberController,
                  uniqueName: Constants.MOBILE_NUMBER,
                ),
                CustomSizedBox(),
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 18),
                ),
                ListTile(
                  title: const Text('Male'),
                  leading: Radio<Gender>(
                    value: Gender.male,
                    groupValue: _gender,
                    onChanged: (Gender value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Female'),
                  leading: Radio<Gender>(
                    value: Gender.female,
                    groupValue: _gender,
                    onChanged: (Gender value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
                CustomSizedBox(),
                CustomTextField(
                  hintText: "Enter your address here",
                  labelText: "Address",
                  errTxt: errorAddress,
                  keyboardType: TextInputType.streetAddress,
                  customReg: r"^[a-zA-Z0-9\s,.'-]{3,}$",
                  controller: addressController,
                  uniqueName: Constants.ADDRESS,
                ),
                CustomSizedBox(),
                CustomTextField(
                  hintText: "Enter your School or University here",
                  labelText: "School or University",
                  errTxt: errorSchool,
                  keyboardType: TextInputType.text,
                  customReg: r"^[a-zA-Z0-9\s,.'-]{3,}$",
                  controller: schoolController,
                  uniqueName: Constants.SCHOOL,
                ),
                CustomSizedBox(),
                Container(
                    width: double.infinity,
                    height: 55,
                    child: FlatButton(
                        onPressed: () {
                          print(ageController.text == "");
                          // final age = int.parse(ageController.text.toString());

                          // print(global.isValidFirstName &&
                          //     global.isValidLastName &&
                          //     global.isValidNIC &&
                          //     global.isValidMobileNumber &&
                          //     global.isValidAddress &&
                          //     global.isValidSchool &&
                          //     (age>= 18 && age<=35));
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 22),
                        )))
              ],
            )),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      setState(() {
        difference =
            ((DateTime.now().difference(selectedDate).inDays) / 365).floor();
        ageController.text = difference.toString();
      });
    }
  }
}
