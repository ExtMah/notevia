import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notevia/controller/sign_up_provider.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/view/components/buttons/login_register_buttons.dart';
import 'package:notevia/view/components/text_fields/shaped_text_field.dart';
import 'package:notevia/view/ui/login_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // UserConnectionProvider userConnectionProvider =
    //     Provider.of<UserConnectionProvider>(context);

    SignUpProvider signUpProvider = Provider.of(context);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF15161b),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: -66,
              top: -25,
              child: Container(
                height: 225,
                width: 225,
                // margin: const EdgeInsets.all(100),
                decoration: const BoxDecoration(
                  color: Color(0xFF1efdff),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -50,
              top: 340,
              child: Container(
                height: 200,
                width: 200,
                // margin: const EdgeInsets.all(100),
                decoration: const BoxDecoration(
                  color: Color(0xFF2bb2ff),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -50,
              bottom: -25,
              child: Container(
                height: 170,
                width: 170,
                // margin: const EdgeInsets.all(100),
                decoration: const BoxDecoration(
                  color: Color(0xFFff5efd),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ImageIcon(
                            AssetImage('assets/images/Icon_NoteVia.png'),
                            size: 100,
                            color: Colors.white,
                          ),
                          Text(
                            'NoteVia.',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Sign up to continue',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: ShapedTextField(
                          // controller: userConnectionProvider.emailController,
                          controller: signUpProvider.emailController,
                          label: 'Email',
                          hint: 'Enter your email',
                          icon: Icons.email,
                          // color: Colors.blue.shade800,
                          iconColor: const Color(0xFF1efdff),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 20, bottom: 20),
                        child: ShapedTextField(
                          // controller: userConnectionProvider.usernameController,
                          controller: signUpProvider.usernameController,
                          label: 'Username',
                          hint: 'Enter your username',
                          icon: Icons.perm_identity,
                          // color: Colors.blue.shade800,
                          iconColor: const Color(0xFF1efdff),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ShapedTextField(
                          // controller: userConnectionProvider.passwordController,
                          controller: signUpProvider.passwordController,
                          label: 'Password',
                          hint: 'Enter your password',
                          obscureText: _obscureText,
                          icon: _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          iconColor: _obscureText == true
                              ? const Color(0xFF1efdff)
                              : Colors.grey[400],
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // userConnectionProvider.loading
                      signUpProvider.loading
                          ? const Padding(
                              padding: EdgeInsets.only(top: 44.0),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : GradientButtons(
                              onPress: () {
                                // userConnectionProvider.signUpRequest(context);
                                signUpProvider.signUpRequest(context);
                              },
                              text: 'Sign up now',
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 4.0),
                              child: Text(
                                'Have an account?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            GestureDetectorButtons(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              text: 'Log in',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
