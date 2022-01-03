import 'package:flutter/material.dart';
import 'package:notevia/controller/user_connection_provider.dart';
import 'package:notevia/controller/user_data_provider.dart';
import 'package:notevia/view/ui/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => UserConnectionProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => UserDataProvider(snapshot.data!),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                fontFamily: 'Poppins',
                primarySwatch: Colors.blue,
              ),
              home: const SplashPage(),
            ),
          );
        }
        return const Center();
      },
    );
  }
}
