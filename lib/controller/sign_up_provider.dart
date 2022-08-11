import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notevia/view/components/links.dart';
import 'package:notevia/view/components/utils.dart';
import 'package:notevia/view/ui/verification_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider extends ChangeNotifier {
  bool loading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Utils utils = Utils();

  SignUpProvider(SharedPreferences sharedPreferences);

  Future signUpRequest(BuildContext context) async {
    loading = true;
    notifyListeners();

    Response response = await post(Links().register, body: {
      'email': emailController.text,
      'name': usernameController.text,
      'password': passwordController.text,
    });
    print(response.body);
    Map<String, dynamic> body = json.decode(response.body);
    if (body['result'] == true) {
      utils.showToast(text: body['msg']);
      var result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationPage(email: emailController.text),
          ));
      if (result == true) {
        Navigator.pop(context, true);
      }
    } else {
      utils.showToast(text: body['action']);
    }

    loading = false;
    notifyListeners();
  }
}
