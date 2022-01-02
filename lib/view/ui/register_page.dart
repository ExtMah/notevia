import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/view/components/buttons/gradient_button.dart';
import 'package:notevia/view/components/text_fields/shaped_text_field.dart';
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
                      'Register',
                      style: TextStyle(
                          fontSize: 25,
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
                  child: TextField(
                    controller: userConnectionProvider.usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.blue.shade800),
                      hintText: 'Enter your username',
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: Icon(
                        Icons.password,
                        color: Colors.blue.shade800,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade800),
                          borderRadius: BorderRadius.circular(15)),
                    ),
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
                GradientButton(
                    onPressed: () {
                      userConnectionProvider.signUpRequest();
                    },
                    text: 'Sign Up'),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have any account?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
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
