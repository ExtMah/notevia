// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:notevia/view/components/links.dart';
// import 'package:notevia/view/components/utils.dart';
// import 'package:notevia/view/ui/home_page.dart';
// import 'package:notevia/view/ui/reset_password_page.dart';
// import 'package:notevia/view/ui/verification_page.dart';
//
// class UserConnectionProvider extends ChangeNotifier {
//   bool loading = false;
//   late String _code;
//
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   Utils utils = Utils();
//
//   Future<void> loginRequest(BuildContext context) async {
//     loading = true;
//     notifyListeners();
//
//     Response response = await post(Links().login, body: {
//       'email': emailController.text,
//       'password': passwordController.text,
//     });
//     print(response.body);
//     Map<String, dynamic> body = json.decode(response.body);
//     if (body['result'] == true) {
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//           (route) => false);
//     } else {
//       utils.showToast(text: body['error']);
//     }
//
//     loading = false;
//     notifyListeners();
//   }
//
//   Future<void> forgotRequest(BuildContext context) async {
//     loading = true;
//     notifyListeners();
//
//     Response response = await post(Links.forgetPassword, body: {
//       'email': emailController.text,
//     });
//     print(response.body);
//     Map<String, dynamic> body = json.decode(response.body);
//     print(response.body);
//     if (body['result'] == true) {
//       var result = await Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => VerificationPage(
//               email: emailController.text,
//             ),
//           ));
//       if (result == true) {
//         result = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ResetPasswordPage(
//                 email: emailController.text,
//                 code: _code,
//               ),
//             ));
//         if (result == true) {
//           Navigator.pop(context, true);
//         }
//       }
//     } else {
//       utils.showToast(text: body['error']);
//     }
//
//     loading = false;
//     notifyListeners();
//   }
//
//   Future signUpRequest(BuildContext context) async {
//     loading = true;
//     notifyListeners();
//
//     Response response = await post(Links().register, body: {
//       'email': emailController.text,
//       'name': usernameController.text,
//       'password': passwordController.text,
//     });
//     print(response.body);
//     Map<String, dynamic> body = json.decode(response.body);
//     if (body['result'] == true) {
//       utils.showToast(text: body['msg']);
//       var result = await Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => VerificationPage(email: emailController.text),
//           ));
//       if (result == true) {
//         Navigator.pop(context, true);
//       }
//     } else {
//       utils.showToast(text: body['action']);
//     }
//
//     loading = false;
//     notifyListeners();
//   }
//
//   Future resentRequest(BuildContext context) async {
//     loading = true;
//     notifyListeners();
//
//     Response response = await post(Links.forgetPassword, body: {
//       'email': emailController.text,
//       'name': usernameController.text,
//       'password': passwordController.text,
//     });
//     print(response.body);
//     Map<String, dynamic> body = json.decode(response.body);
//     if (body['result'] == true) {
//       utils.showToast(text: 'Code sent');
//     } else {
//       utils.showToast(text: body['action']);
//     }
//
//     loading = false;
//     notifyListeners();
//   }
//
//   Future verificationRequest(
//       BuildContext context, String code, String email) async {
//     loading = true;
//     notifyListeners();
//
//     Response response = await post(Links().verifier, body: {
//       'code': code,
//       'email': email,
//     });
//     print(response.body);
//     Map<String, dynamic> body = json.decode(response.body);
//     if (body['result'] == true) {
//       _code = code;
//       Navigator.pop(context, true);
//     } else {
//       utils.showToast(text: body['error']);
//     }
//
//     loading = false;
//     notifyListeners();
//   }
//
//   Future<void> changePasswordRequest(
//       BuildContext context, String email, String code) async {
//     if (confirmPasswordController.text != passwordController.text) {
//       utils.showToast(text: "Email and confirm email not match");
//       return;
//     }
//     loading = true;
//     notifyListeners();
//
//     Response response = await post(Links().resetPassword, body: {
//       'email': email,
//       'new_password': passwordController.text,
//       'code': code,
//     });
//     print(response.body);
//     Map<String, dynamic> body = json.decode(response.body);
//     if (body['result'] == true) {
//       Navigator.pop(context, true);
//     } else {
//       utils.showToast(text: body['error']);
//     }
//
//     loading = false;
//     notifyListeners();
//   }
//
//   Future<void> insertCategoryRequest(
//       BuildContext context, String email, String code) async {
//     if (confirmPasswordController.text != passwordController.text) {
//       utils.showToast(text: "Email and confirm email not match");
//       return;
//     }
//     loading = true;
//     notifyListeners();
//
//     Response response = await post(Links().resetPassword, body: {
//       'email': email,
//       'new_password': passwordController.text,
//       'code': code,
//     });
//
//     Map<String, dynamic> body = json.decode(response.body);
//     if (body['result'] == true) {
//       Navigator.pop(context, true);
//     } else {
//       utils.showToast(text: body['error']);
//     }
//
//     loading = false;
//     notifyListeners();
//   }
// }
