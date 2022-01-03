import 'package:flutter/material.dart';

class GradientButtons extends StatelessWidget {
  final VoidCallback onPress;
  final String text;

  const GradientButtons({Key? key, required this.onPress, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade700,
              Colors.blue,
            ],
          ),
        ),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          height: 65,
          minWidth: 330,
          // color: const Color(0xFF877ef5),
          onPressed: onPress,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}

class GestureDetectorButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const GestureDetectorButtons(
      {Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
