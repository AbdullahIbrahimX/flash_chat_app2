import 'package:flash_chat_app2/components/flash_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = "registration_page";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            getLogo(height: 200.0),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              }, //Enter your email
              decoration: kRegisterInputDecoration.copyWith(
                  hintText: "Enter your email"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              }, //Enter your password
              decoration: kRegisterInputDecoration.copyWith(
                  hintText: "Enter your password"),
            ),
            SizedBox(
              height: 24.0,
            ),
            FlashButton(
              text: "Register",
              color: Colors.blueAccent,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
