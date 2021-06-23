import 'dart:ffi';

import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  SignInButton({
    this.child,
    this.color: Colors.red,
    this.onPress,
    this.borderRadius,
    this.text,
    this.textColor,
    this.LinkIMG,
    this.height: 50,
  });
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPress;
  final String text;
  final Color textColor;
  final String LinkIMG;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        color: color,
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              height: 25,
              image: AssetImage(LinkIMG ?? ''),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                color: textColor,
              ),
            ),
            Opacity(
              opacity: 0,
              child: Image(
                height: 25,
                image: AssetImage(LinkIMG ?? ''),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
    );
  }
}
