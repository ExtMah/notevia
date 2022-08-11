import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:notevia/view/components/links.dart';
import 'package:notevia/view/components/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationProvider extends ChangeNotifier {
  bool loading = false;
  late String _code;

  Utils utils = Utils();

  VerificationProvider(SharedPreferences sharedPreferences);

  Future verificationRequest(
      BuildContext context, String code, String email) async {
    loading = true;
    notifyListeners();

    Response response = await post(Links().verifier, body: {
      'code': code,
      'email': email,
    });
    print(response.body);
    Map<String, dynamic> body = json.decode(response.body);
    if (body['result'] == true) {
      _code = code;
      Navigator.pop(context, true);
    } else {
      utils.showToast(text: body['error']);
    }

    loading = false;
    notifyListeners();
  }
}
