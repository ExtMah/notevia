import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notevia/view/components/links.dart';
import 'package:notevia/view/components/utils.dart';
import 'package:notevia/view/ui/reset_password_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordProvider extends ChangeNotifier {
  bool loading = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Utils utils = Utils();

  ChangePasswordProvider(SharedPreferences sharedPreferences);

  Future<void> changePasswordRequest(
      BuildContext context, String email, String code) async {
    if (confirmPasswordController.text != passwordController.text) {
      utils.showToast(text: "Email and confirm email not match");
      return;
    }
    loading = true;
    notifyListeners();

    Response response = await post(Links().resetPassword, body: {
      'email': email,
      'new_password': passwordController.text,
      'code': code,
    });
    print(response.body);
    Map<String, dynamic> body = json.decode(response.body);
    if (body['result'] == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordPage(email: email, code: code),
          ),
          (route) => false);
    } else {
      utils.showToast(text: body['error']);
    }

    loading = false;
    notifyListeners();
  }
}
