import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notevia/controller/change_password_provider.dart';
import 'package:notevia/controller/insert_password_provider.dart';
import 'package:notevia/controller/resent_code_provider.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/view/components/buttons/login_register_buttons.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key, required this.email, required this.code})
      : super(key: key);

  final String email;
  final String code;

  @override
  State<ResetPasswordPage> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<ResetPasswordPage> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    // UserConnectionProvider userConnectionProvider =
    //     Provider.of<UserConnectionProvider>(context);

    InsertPasswordProvider insertPasswordProvider = Provider.of(context);

    ChangePasswordProvider changePasswordProvider = Provider.of(context);

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
                'Create new password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 31),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 30.0),
              child: Text(
                'Your new password must be different from previous used passwords',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: TextField(
                // controller: userConnectionProvider.passwordController,
                controller: insertPasswordProvider.passwordController,
                obscureText: _obscureText1,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'New password',
                  labelStyle: TextStyle(color: Colors.blue.shade800),
                  hintText: 'New password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText1 = !_obscureText1;
                      });
                    },
                    child: Icon(
                      _obscureText1 ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade800),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                // controller: userConnectionProvider.confirmPasswordController,
                controller: insertPasswordProvider.confirmPasswordController,
                obscureText: _obscureText2,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Confirm password',
                  labelStyle: TextStyle(color: Colors.blue.shade800),
                  hintText: 'Confirm password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText2 = !_obscureText2;
                      });
                    },
                    child: Icon(
                      _obscureText2 ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade800),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: GradientButtons(
                  onPress: () {
                    // userConnectionProvider.changePasswordRequest(
                    changePasswordProvider.changePasswordRequest(
                        context, widget.email, widget.code);
                  },
                  text: 'Reset Password'),
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
