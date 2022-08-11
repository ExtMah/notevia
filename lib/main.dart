import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notevia/controller/change_password_provider.dart';
import 'package:notevia/controller/forgot_password_provider.dart';
import 'package:notevia/controller/global_setting_provider.dart';
import 'package:notevia/controller/home_provider.dart';
import 'package:notevia/controller/insert_password_provider.dart';
import 'package:notevia/controller/login_provider.dart';
import 'package:notevia/controller/resent_code_provider.dart';
import 'package:notevia/controller/sign_up_provider.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/controller/user_data_provider.dart';
import 'package:notevia/controller/verification_provider.dart';
import 'package:notevia/view/ui/home_page.dart';
import 'package:notevia/view/ui/profile_page.dart';
import 'package:notevia/view/ui/splash_page.dart';
import 'package:notevia/view/ui/testtttttttttttttttttttttt.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);

    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => GlobalSettingProvider(snapshot.data!),
              ),
              // ChangeNotifierProvider(
              //   create: (context) => UserConnectionProvider(),
              // ),
              ChangeNotifierProvider(
                create: (context) => SignUpProvider(snapshot.data!),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginProvider(snapshot.data!),
              ),
              ChangeNotifierProvider(
                create: (context) => ChangePasswordProvider(snapshot.data!),
              ),
              ChangeNotifierProvider(
                create: (context) => ForgotProvider(snapshot.data!),
              ),
              ChangeNotifierProvider(
                create: (context) => InsertPasswordProvider(snapshot.data!),
              ),
              ChangeNotifierProvider(
                create: (context) => ResentCodeProvider(snapshot.data!),
              ),
              ChangeNotifierProvider(
                create: (context) => VerificationProvider(snapshot.data!),
              ),
              ChangeNotifierProvider(
                create: (context) => UserDataProvider(snapshot.data!),
              ),
              ChangeNotifierProvider(
                create: (context) => HomeProvider(),
              ),
            ],
            // child: const _MainApp(),
            child: const _MainApp(
              email: '',
              code: '',
            ),
          );
        }
        return const Center();
      },
    );
  }
}

class _MainApp extends StatelessWidget {
  const _MainApp({Key? key, required this.email, required this.code})
      : super(key: key);
  static const String title = 'Light & Dark Mode';

  final String email;
  final String code;

  @override
  Widget build(BuildContext context) {
    GlobalSettingProvider globalSettingProvider = Provider.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: globalSettingProvider.isDarkMode
          ? MyThemes.darkTheme
          : MyThemes.lightTheme,
      // home: const SplashPage(),
      home: const HomePage(),
      // home: const ProfilePage(),
      // home: ResetPasswordPage(email: email, code: code),
    );
  }
}
