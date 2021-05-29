import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  Color color;
  Color textColor;
  String text;
  IconData icon;
  Function onPressed;

  ButtonApp(
      {this.color,
      this.textColor,
      this.icon = Icons.arrow_forward_ios,
      this.onPressed,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          onPressed();
        },
        color: Colors.blueGrey,
        textColor: textColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 50, alignment: Alignment.center, child: Text(text)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 50,
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(icon),
                  backgroundColor: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
  }
}
