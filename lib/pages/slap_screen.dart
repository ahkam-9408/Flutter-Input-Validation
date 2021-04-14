import 'package:flutter/material.dart';
import 'package:input_validation_excercise/pages/form.dart';

class SlapScreen extends StatefulWidget {
  SlapScreen({Key key}) : super(key: key);

  @override
  _SlapScreenState createState() => _SlapScreenState();
}

class _SlapScreenState extends State<SlapScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 9600), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FormPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/mobile_dev.gif',
                  width: screenWidth / 6 * 5,
                  height: screenWidth / 6 * 5,
                  fit: BoxFit.fitWidth),
              Text(
                "ProAcademy Online",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: screenHeight / 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(4, 4),
                          blurRadius: 20)
                    ]),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Loading...",
                style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: screenHeight / 40,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
