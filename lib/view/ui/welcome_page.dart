import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFedfaff),
      body: SingleChildScrollView(
        child: Padding(
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
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/splash_bg.jpg'),
                    //     fit: BoxFit.cover),
                    gradient: LinearGradient(colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade800,
                      Colors.blue,
                    ]),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/undraw_calculator.svg',
                      semanticsLabel: "Asgar",
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    const Text(
                      'Discover your \nroutine here fellas',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                      flex: 2,
                    ),
                    Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              bottomRight: Radius.circular(45)),
                          side: BorderSide(color: Colors.white, width: 1)),
                      color: const Color(0xFFcfedf7),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            elevation: 0,
                            minWidth: MediaQuery.of(context).size.width * .40,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(45))),
                            height: 50,
                            color: Colors.white,
                            onPressed: () {},
                            child: const Text(
                              'Register',
                            ),
                          ),
                          MaterialButton(
                            elevation: 0,
                            height: 50,
                            minWidth: MediaQuery.of(context).size.width * .40,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                // topRight: Radius.circular(12),
                                bottomRight: Radius.circular(45),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue.shade800,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
