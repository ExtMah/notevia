import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notevia/controller/forgot_password_provider.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/view/components/buttons/login_register_buttons.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserConnectionProvider userConnectionProvider =
    //     Provider.of<UserConnectionProvider>(context);

    ForgotProvider forgotProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: SvgPicture.asset(
                'assets/svg/undraw_verification.svg',
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Reset password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 31),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 30.0),
              child: Text(
                'Enter the email associated whit your account and we\'ll send an email with code to reset your password',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: TextField(
                // controller: userConnectionProvider.emailController,
                controller: forgotProvider.emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                      // borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.blue.shade800),
                  hintText: 'Enter your Email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(
                    Icons.email,
                    color: Colors.blue.shade800,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade800),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: GradientButtons(
                  onPress: () {
                    // userConnectionProvider.forgotRequest(context);
                    forgotProvider.forgotRequest(context);
                  },
                  text: 'Send Code'),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}
