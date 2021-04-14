import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    Future<bool> _onBackPressed() {
      return AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.TOPSLIDE,
            title: 'Are you sure?',
            desc: 'Do you want to exit?',
            btnOkText: "Exit",
            btnOkIcon: Icons.exit_to_app,
            btnCancelIcon: Icons.cancel,
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              SystemNavigator.pop();
            },
          ).show() ??
          false;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          shadows: [
                            Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(4, 4),
                                blurRadius: 20)
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    hintText: "Enter your first name here",
                    labelText: "First Name",
                    keyboardType: TextInputType.name,
                    controller: firstNameController,
                    uniqueName: Constants.FIRST_NAME,
                    customReg: r"^(?![\s.]+$)[a-zA-Z\s.]*$",
                    errTxt: errorFirstName,
                  ),
                  CustomSizedBox(),
                  CustomTextField(
                    hintText: "Enter your last name here",
                    labelText: "Last Name",
                    keyboardType: TextInputType.name,
                    controller: lastNameController,
                    uniqueName: Constants.LAST_NAME,
                    customReg: r"^(?![\s.]+$)[a-zA-Z\s.]*$",
                    errTxt: errorLastName,
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
                    height: 12,
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
                    keyboardType: TextInputType.name,
                    controller: ageController,
                    errTxt: errorAge,
                    isEnabled: false,
                    isGrey: true,
                  ),
                  CustomSizedBox(),
                  CustomTextField(
                    hintText: "Enter your Number here",
                    labelText: "NIC",
                    keyboardType: TextInputType.text,
                    controller: nicController,
                    uniqueName: Constants.NIC,
                    customReg: r"^[0-9]{9}[A-Z]{1}$",
                    customReg2: r"^[0-9]{12}$",
                    errTxt: errorNIC,
                    maxLength: 12,
                  ),
                  CustomSizedBox(),
                  CustomTextField(
                    hintText: "Enter your mobile number here",
                    labelText: "Mobile Number",
                    keyboardType: TextInputType.phone,
                    controller: mobileNumberController,
                    uniqueName: Constants.MOBILE_NUMBER,
                    customReg: r"^[0-9]{10}$",
                    errTxt: errorMobileNumber,
                    maxLength: 10,
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
                    keyboardType: TextInputType.streetAddress,
                    controller: addressController,
                    uniqueName: Constants.ADDRESS,
                    customReg: r"^[a-zA-Z0-9\s,.'-]{3,}$",
                    errTxt: errorAddress,
                  ),
                  CustomSizedBox(),
                  CustomTextField(
                    hintText: "Enter your School or University here",
                    labelText: "School or University",
                    keyboardType: TextInputType.text,
                    controller: schoolController,
                    uniqueName: Constants.SCHOOL,
                    customReg: r"^[a-zA-Z0-9\s,.'-]{3,}$",
                    errTxt: errorSchool,
                  ),
                  CustomSizedBox(),
                  Container(
                      width: double.infinity,
                      height: 55,
                      child: FlatButton(
                          onPressed: () {
                            if (ageController.text != "") {
                              final age =
                                  int.parse(ageController.text.toString());

                              if (global.isValidFirstName &&
                                  global.isValidLastName &&
                                  global.isValidNIC &&
                                  global.isValidMobileNumber &&
                                  global.isValidAddress &&
                                  global.isValidSchool &&
                                  (age >= 18 && age <= 35)) {
                                displayMessage(
                                    DialogType.SUCCES,
                                    "SUCCESS",
                                    "You are Successfully Registered to ProAcademy",
                                    Colors.green);

                                print('First Name: ' +
                                    firstNameController.text +
                                    '\nLast Name: ' +
                                    lastNameController.text +
                                    '\nDate of birth: ' +
                                    selectedDate.toString() +
                                    '\nAge: ' +
                                    ageController.text +
                                    '\nNIC Number: ' +
                                    nicController.text +
                                    '\nMobile Number: ' +
                                    mobileNumberController.text +
                                    '\nGender: ' +
                                    _gender.toString() +
                                    '\nAddress: ' +
                                    addressController.text +
                                    '\nSchool or University: ' +
                                    schoolController.text);

                                firstNameController.text = "";
                                lastNameController.text = "";
                                selectedDate = DateTime.now();
                                ageController.text = 0.toString();
                                nicController.text = "";
                                mobileNumberController.text = "";
                                addressController.text = "";
                                schoolController.text = "";
                              } else {
                                displayMessage(
                                    DialogType.ERROR,
                                    "ERROR!!!",
                                    "Please provide correct details to register",
                                    Colors.red);
                              }
                            } else {
                              displayMessage(
                                  DialogType.ERROR,
                                  "ERROR!!!",
                                  "Please provide correct details to register",
                                  Colors.red);
                            }
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
      ),
    );
  }

  void displayMessage(DialogType type, String title, String desc, Color color) {
    AwesomeDialog(
            context: context,
            dialogType: type,
            animType: AnimType.BOTTOMSLIDE,
            title: title,
            desc: desc,
            btnOkOnPress: () {},
            btnOkColor: color)
        .show();
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
