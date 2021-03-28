import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app2/components/flash_button.dart';
import 'package:flash_chat_app2/screens/chat_screen.dart';
import 'package:flash_chat_app2/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const id = "login_page";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
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
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                email = value;
              },
              decoration: kLoginInputDecoration.copyWith(
                hintText: "Enter your Email",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                password = value;
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
              onPress: () async {
                try {
                  UserCredential userCredential =
                      await auth.signInWithEmailAndPassword(
                          email: email, password: password);
                  if (userCredential != null) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == "user-not-found") {
                    print("no such user!");
                    Navigator.popAndPushNamed(context, RegistrationScreen.id);
                  } else if (e.code == "wrong-password") {
                    print("email or password is wrong");
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
