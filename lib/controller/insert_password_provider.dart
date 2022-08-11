import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:notevia/view/components/links.dart';
import 'package:notevia/view/components/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertPasswordProvider extends ChangeNotifier {
  bool loading = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Utils utils = Utils();

  InsertPasswordProvider(SharedPreferences sharedPreferences);

  Future<void> insertCategoryRequest(
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

    Map<String, dynamic> body = json.decode(response.body);
    if (body['result'] == true) {
      Navigator.pop(context, true);
    } else {
      utils.showToast(text: body['error']);
    }

    loading = false;
    notifyListeners();
  }
}
