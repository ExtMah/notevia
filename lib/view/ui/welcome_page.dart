import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:notevia/view/components/buttons/welcome_page_buttons.dart';
import 'package:notevia/view/ui/home_page.dart';
import 'package:notevia/view/ui/login_page.dart';
import 'package:notevia/view/ui/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFedfaff),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade800,
                    Colors.blue,
                  ]),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/undraw_calculator.svg',
                    semanticsLabel: "Mhmd",
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  const Text(
                    'Discover your \nroutine here fellas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 60, right: 60),
                    child: Text(
                      'Explore all of accounting things here',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 45, right: 45),
                    child: Text(
                      'Explore all of accounting things here my',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        side: BorderSide(color: Colors.white, width: 1)),
                    color: const Color(0xFFcfedf7),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WelcomePageButtons(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          onPress: () async {
                            var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                            if (result == true) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            }
                          },
                          text: 'Sign up',
                          color: Colors.white,
                          textStyle: const TextStyle(color: Colors.black),
                        ),
                        WelcomePageButtons(
                          onPress: () async {
                            var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                            if (result == true) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            }
                          },
                          text: 'Log In',
                          textStyle: const TextStyle(color: Colors.white),
                          color: Colors.blue.shade800,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(45),
                                topRight: Radius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
