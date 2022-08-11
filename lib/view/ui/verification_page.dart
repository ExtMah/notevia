import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notevia/controller/resent_code_provider.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/controller/verification_provider.dart';
import 'package:provider/provider.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    Color otpColor1 = const Color(0xFF121212);
    Color otpColor2 = const Color(0xFF121212);
    Color otpColor3 = const Color(0xFF121212);
    Color otpColor4 = const Color(0xFF121212);
    Color otpColor5 = const Color(0xFF121212);
    Color otpColor6 = const Color(0xFF1293E7);

    TextStyle? createStyle(Color color) {
      ThemeData theme = Theme.of(context);
      return theme.textTheme.headline3?.copyWith(color: color);
    }

    List<TextStyle?> otpTextStyles = [
      createStyle(otpColor1),
      createStyle(otpColor2),
      createStyle(otpColor3),
      createStyle(otpColor4),
      createStyle(otpColor5),
    ];

    // UserConnectionProvider userConnectionProvider =
    //     Provider.of<UserConnectionProvider>(context);

    VerificationProvider verificationProvider = Provider.of(context);

    ResentCodeProvider resentCodeProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svg/undraw_verification.svg',
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
                const Text(
                  'Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Text(
                    'Please enter the verification code we sent to your email address',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: otpColor1,
                  focusedBorderColor: otpColor6,
                  styles: otpTextStyles,
                  showFieldAsBox: false,
                  borderWidth: 4.0,
                  onCodeChanged: (String code) {},
                  // onSubmit: (String verificationCode) => userConnectionProvider
                  onSubmit: (String verificationCode) => verificationProvider
                      .verificationRequest(context, verificationCode, email),
                ),
                const SizedBox(
                  height: 85,
                ),
                const Text('Didn\'t receive any code?'),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  child: const Text(
                    'RESENT CODE',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  onTap: () {
                    // userConnectionProvider.resentRequest(context);
                    resentCodeProvider.resentRequest(context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
