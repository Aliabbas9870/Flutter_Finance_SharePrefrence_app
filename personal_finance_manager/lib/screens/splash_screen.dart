

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_finance_manager/screens/bottom_navigation.dart';
import 'package:personal_finance_manager/screens/home_screen.dart';
import 'package:personal_finance_manager/screens/login_screen.dart';
import 'package:personal_finance_manager/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KeyLogin = "Login";
  static const String KeyName = "Name";
  static const String KeyEmail = "email";
  @override
  void initState() {
    super.initState();
    _navigateToHome();
    // Timer(
    //   Duration(seconds: 2){
    //     Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginScreen()));
    //   }
    // );
  }

  _navigateToHome() async {
    var sharepref = await SharedPreferences.getInstance();
    var isLoginIn = sharepref.getBool(KeyLogin);
     var name = sharepref.getString(KeyName);
     var email = sharepref.getString(KeyEmail);
    if (isLoginIn != null) {
      if (isLoginIn) {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigation(
                    name:name??" ",email: email??"",
                  )),
        );
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
        );
      }
    } else {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    }
    // await Future.delayed(Duration(seconds: 3));
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 224, 240),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 237, 222, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 350,
                child: Lottie.asset(
                  'assets/animation/welcome.json',
                )),
            SizedBox(
              height: 18,
            ),
            // Center(
            //     child: Text('Personal Finance Manager',
            //         style: GoogleFonts.aclonica(
            //             fontSize: 22,
            //             fontWeight: FontWeight.bold,

            
            //             color: Color.fromARGB(255, 40, 38, 41)))),


            
          ],
        ),
      ),
    );
  }
}
