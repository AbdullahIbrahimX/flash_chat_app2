import 'package:flutter/material.dart';

class FlashButton extends StatelessWidget {
  Function _onPress;
  String _text;
  Color _color;

  // FlashButton(this._onPress, this._text, this._color);
  FlashButton({text: String, onPress: Function, color: Color}) {
    this._color = color;
    this._onPress = onPress;
    this._text = text;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: _color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: _onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            _text,
          ),
        ),
      ),
    );
  }
}
