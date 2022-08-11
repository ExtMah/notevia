import 'package:flutter/material.dart';

class WelcomePageButtons extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color color;
  final RoundedRectangleBorder shape;
  final TextStyle textStyle;

  const WelcomePageButtons(
      {Key? key,
      required this.onPress,
      required this.text,
      required this.color,
      required this.shape,
      required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: MediaQuery.of(context).size.width * .40,
      height: 55,
      shape: shape,
      onPressed: onPress,
      color: color,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
