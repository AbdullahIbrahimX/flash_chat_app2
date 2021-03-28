import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_app2/components/flash_button.dart';
import 'package:flash_chat_app2/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "welcome_page";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  // String Title = "Flash chat app";
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                getLogo(height: 60.0),
                DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText("Flash Chat"),
                      TypewriterAnimatedText("The Best"),
                      TypewriterAnimatedText("Chat App"),
                      TypewriterAnimatedText("ON EARTH"),
                      TypewriterAnimatedText("AND MARS"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            FlashButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            FlashButton(
              text: "Register",
              color: Colors.blueAccent,
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
