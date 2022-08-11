import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notevia/view/components/links.dart';
import 'package:notevia/view/components/utils.dart';
import 'package:notevia/view/ui/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool loading = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Utils utils = Utils();

  LoginProvider(SharedPreferences sharedPreferences);

  Future<void> loginRequest(BuildContext context) async {
    var loading = true;
    notifyListeners();

    Response response = await post(Links().login, body: {
      'email': emailController.text,
      'password': passwordController.text,
    });
    print(response.body);
    Map<String, dynamic> body = json.decode(response.body);
    if (body['result'] == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    } else {
      utils.showToast(text: body['error']);
    }

    loading = false;
    notifyListeners();
  }
}
