import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notevia/view/components/links.dart';

class Api {
  http.Client client = http.Client();
  Api();

  validateResponse(http.Response response) {
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future post(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? header,
  }) async {
    http.Response response = await client.post(Uri.parse(Links.baseUrl + url),
        body: body, headers: header ?? {});

    if (validateResponse(response)) {
      return json.decode(response.body);
    }

    return false;
  }
}
