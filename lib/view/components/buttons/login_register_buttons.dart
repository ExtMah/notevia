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
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              // Colors.blue.shade900,
              // Colors.blue.shade700,
              // Colors.blue,
              Color(0xff196991),
              Color(0xff196991),
            ],
          ),
        ),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          // height: 65,
          // minWidth: 330,
          height: 56,
          minWidth: 200,
          // color: const Color(0xFF877ef5),
          onPressed: onPress,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.5,
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
        style: const TextStyle(
          // color: Colors.blue.shade800,
          color: Color(0xFF1efdff),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
