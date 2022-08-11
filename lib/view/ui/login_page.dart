import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notevia/controller/login_provider.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/view/components/buttons/login_register_buttons.dart';
import 'package:notevia/view/components/text_fields/shaped_text_field.dart';
import 'package:notevia/view/ui/forgot_password_page.dart';
import 'package:notevia/view/ui/register_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // UserConnectionProvider userConnectionProvider =
    //     Provider.of<UserConnectionProvider>(context);
    LoginProvider loginProvider = Provider.of(context);
    return Scaffold(
      // backgroundColor: const Color(0xFFedfaff),
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: ListView(
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
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/images/Icon_NoteVia.png'),
                        size: 100,
                        color: Colors.blue.shade800,
                      ),
                      const Text(
                        'NoteVia',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Log in to continue',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 20),
                    child: ShapedTextField(
                      // controller: userConnectionProvider.emailController,
                      controller: loginProvider.emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                      icon: Icons.email,
                      iconColor: Colors.blue.shade800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: ShapedTextField(
                      // controller: userConnectionProvider.passwordController,
                      controller: loginProvider.passwordController,
                      label: 'Password',
                      hint: 'Enter your password',
                      obscureText: _obscureText,
                      icon: _obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      iconColor: _obscureText == true
                          ? Colors.blue.shade800
                          : Colors.grey,
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 30, right: 30),
                  //   child: TextField(
                  //     controller: userConnectionProvider.passwordController,
                  //     obscureText: _obscureText,
                  //     inputFormatters: [LengthLimitingTextInputFormatter(20)],
                  //     decoration: InputDecoration(
                  //       filled: true,
                  //       fillColor: Colors.white70,
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide.none,
                  //           borderRadius: BorderRadius.circular(15)),
                  //       labelText: 'Password',
                  //       labelStyle: TextStyle(color: Colors.blue.shade800),
                  //       hintText: 'Enter your password',
                  //       hintStyle: const TextStyle(color: Colors.grey),
                  //       suffixIcon: InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             _obscureText = !_obscureText;
                  //           });
                  //         },
                  //         child: Icon(
                  //           _obscureText
                  //               ? Icons.visibility
                  //               : Icons.visibility_off,
                  //           color: _obscureText == true
                  //               ? Colors.blue.shade800
                  //               : Colors.grey,
                  //         ),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.blue.shade800),
                  //           borderRadius: BorderRadius.circular(15)),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    // child: userConnectionProvider.loading == true
                    child: loginProvider.loading == true
                        ? const CircularProgressIndicator()
                        : GradientButtons(
                            onPress: () => loginProvider.loginRequest(context),
                            text: 'Log in'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetectorButtons(
                          onTap: () async {
                            var result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage(),
                                ));
                            if (result == true) {
                              Navigator.pop(context, true);
                            }
                          },
                          text: 'Forgot password ?',
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetectorButtons(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          text: 'Sign up',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
