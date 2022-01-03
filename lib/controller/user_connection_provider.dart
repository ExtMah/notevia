import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:notevia/view/components/links.dart';
import 'package:notevia/view/components/utils.dart';

class UserConnectionProvider extends ChangeNotifier {
  bool loading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Utils utils = Utils();

  Future loginRequest() async {
    loading = true;
    notifyListeners();
    Response response = await post(Links().login, body: {
      'name': usernameController.text,
      'password': passwordController.text,
    });
    print(response.body);
    Map<String, dynamic> body = json.decode(response.body);
    if (body['result'] == true) {
    } else {
      utils.showToast(text: body['error']);
    }

    loading = false;
    notifyListeners();
  }

  Future signUpRequest() async {
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
    } else {
      utils.showToast(text: body['error']);
    }

    loading = false;
    notifyListeners();
  }
}
