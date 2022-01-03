import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/view/components/buttons/login_register_buttons.dart';
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
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/images/Icon_NoteVia.png'),
                      size: 100,
                      color: Colors.blue.shade800,
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // SizedBox(
                    //   height: 40,
                    //   width: 40,
                    //   child: Image.asset('assets/images/logo_NoteVia2.png'),
                    // ),
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
                  child: TextField(
                    controller: userConnectionProvider.usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Username or Email',
                      labelStyle: TextStyle(color: Colors.blue.shade800),
                      hintText: 'Enter your username or Email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: Icon(
                        Icons.perm_identity,
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
                          color: _obscureText == true
                              ? Colors.blue.shade800
                              : Colors.grey,
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
                      userConnectionProvider.loginRequest();
                    },
                    text: 'Log in'),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetectorButtons(
                        onTap: () {},
                        text: 'Forgot password ?',
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
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
        ),
      ),
    );
  }
}
