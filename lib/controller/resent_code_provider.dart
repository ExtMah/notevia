import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:notevia/view/components/links.dart';
import 'package:notevia/view/components/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResentCodeProvider extends ChangeNotifier {
  bool loading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Utils utils = Utils();

  ResentCodeProvider(SharedPreferences sharedPreferences);

  Future resentRequest(BuildContext context) async {
    loading = true;
    notifyListeners();

    Response response = await post(Links.forgetPassword, body: {
      'email': emailController.text,
      'name': usernameController.text,
      'password': passwordController.text,
    });
    print(response.body);
    Map<String, dynamic> body = json.decode(response.body);
    if (body['result'] == true) {
      utils.showToast(text: 'Code sent');
    } else {
      utils.showToast(text: body['action']);
    }

    loading = false;
    notifyListeners();
  }
}
