import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notevia/controller/user_data_provider.dart';
import 'package:notevia/view/ui/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      UserDataProvider userDataProvider =
          Provider.of<UserDataProvider>(context, listen: false);
      if (userDataProvider.isLoggedIn) {
        // todo go to main page

      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomePage(),
              ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash_bg.jpg',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: SizedBox(
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 60.0,
                  fontFamily: 'PoppinsBold',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Note\nVia.',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
