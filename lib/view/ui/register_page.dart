import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    UserConnectionProvider userConnectionProvider =
        Provider.of<UserConnectionProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFedfaff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 125),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/images/Icon_NoteVia.png'),
                      size: 100,
                      color: Colors.blue.shade800,
                    ),
                    const Text(
                      'NoteVia.',
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
                    'Sign up to continue',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: ShapedTextField(
                    controller: userConnectionProvider.emailController,
                    hint: 'Enter your email',
                    icon: Icons.email,
                    label: 'Email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 20),
                  child: ShapedTextField(
                    controller: userConnectionProvider.usernameController,
                    hint: 'Enter your username',
                    icon: Icons.perm_identity,
                    label: 'Username',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: userConnectionProvider.passwordController,
                    obscureText: _obscureText,
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.blue.shade800),
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade800),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                GradientButtons(
                  onPress: () {
                    userConnectionProvider.signUpRequest();
                  },
                  text: 'Sign up now',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
        ),
      ),
    );
  }
}
