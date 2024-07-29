import 'package:flutter/material.dart';
import 'package:personal_finance_manager/screens/bottom_navigation.dart';
import 'package:personal_finance_manager/screens/login_screen.dart';
import 'package:personal_finance_manager/screens/register_screen.dart';
import 'package:personal_finance_manager/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  bool _isChecked = false;

  Future<void> _login() async {
    var email = emailController.text;
    var password = passController.text;

    var sharepref = await SharedPreferences.getInstance();
    var storedEmail = sharepref.getString('email');
    var storedPassword = sharepref.getString('password');
    var storedName = sharepref.getString(SplashScreenState.KeyName);

    if (email == storedEmail && password == storedPassword) {
      sharepref.setBool(SplashScreenState.KeyLogin, true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigation(
            name: storedName ?? '',
            email: storedEmail ?? " ",
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 224, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 224, 240),
        automaticallyImplyLeading: false,
        title: Text(
          "Login",
          style: TextStyle(
              color: Color(0xff5A639C),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome back",
                style: TextStyle(
                    color: Color(0xff5A639C),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 3),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      enableSuggestions: false,
                      controller: emailController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email_outlined),
                          label: Text("Email",
                              style: TextStyle(
                                color: Color(0xff5A639C),
                              )),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    TextField(
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.password),
                          label: Text("Password",
                              style: TextStyle(
                                color: Color(0xff5A639C),
                              )),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    // Row(
                    //   children: [
                    //     Checkbox(
                    //         value: _isChecked,
                    //         onChanged: (bool? val) {
                    //           setState(() {
                    //             _isChecked = val ?? false;
                    //           });
                    //         }),
                    //     Expanded(
                    //       child: Row(
                    //         children: [
                    //           Text("By Signing up, you agree"),
                    //           InkWell(
                    //             onTap: () {},
                    //             child: Text(
                    //               " terms and condition",
                    //               style: TextStyle(
                    //                 color: Color(0xff9B86BD),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: _login,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 17,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff5A639C)),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(child: Text("Or")),
                    SizedBox(
                      height: 12,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have a account?"),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff9B86BD),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
