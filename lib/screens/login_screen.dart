import 'package:flash_chat_app2/components/flash_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const id = "login_page";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kLoginInputDecoration.copyWith(
                hintText: "Enter your Email",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kLoginInputDecoration.copyWith(
                hintText: "Enter your password",
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            FlashButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
