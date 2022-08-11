import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notevia/view/components/links.dart';
import 'package:notevia/view/components/utils.dart';
import 'package:notevia/view/ui/reset_password_page.dart';
import 'package:notevia/view/ui/verification_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotProvider extends ChangeNotifier {
  bool loading = false;
  late String _code;

  TextEditingController emailController = TextEditingController();

  Utils utils = Utils();

  ForgotProvider(SharedPreferences sharedPreferences);

  Future<void> forgotRequest(BuildContext context) async {
    loading = true;
    notifyListeners();

    Response response = await post(Links.forgetPassword, body: {
      'email': emailController.text,
    });
    print(response.body);
    Map<String, dynamic> body = json.decode(response.body);
    print(response.body);
    if (body['result'] == true) {
      var result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationPage(
              email: emailController.text,
            ),
          ));
      if (result == true) {
        result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(
                email: emailController.text,
                code: _code,
              ),
            ));
        if (result == true) {
          Navigator.pop(context, true);
        }
      }
    } else {
      utils.showToast(text: body['error']);
    }

    loading = false;
    notifyListeners();
  }
}
