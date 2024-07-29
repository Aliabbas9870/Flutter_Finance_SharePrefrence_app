import 'package:flutter/material.dart';
import 'package:personal_finance_manager/screens/bottom_navigation.dart';
import 'package:personal_finance_manager/screens/login_screen.dart';
import 'package:personal_finance_manager/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 224, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 224, 240),
        automaticallyImplyLeading: false,
        title: Text(
          "Sign Up",
          style: TextStyle(
              color: Color(0xff5A639C),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 55),
              Text("Welcome To PFM",
                  style: TextStyle(
                      color: Color(0xff5A639C),
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 12),
              Text("Create the sign up and get started",
                  style: TextStyle(
                    color: Color(0xff5A639C),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 3),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        enableSuggestions: false,

                        controller: nameController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person),
                            label: Text(
                              "Name",
                              style: TextStyle(
                                color: Color(0xff5A639C),
                              ),
                            ),
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      SizedBox(height: 13),
                      TextField(
                        controller: emailController,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email),
                            label: Text("Email",
                            
                                style: TextStyle(
                                  color: Color(0xff5A639C),
                                )),
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      SizedBox(height: 13),
                      TextField(
                        enableSuggestions: false,

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
                      SizedBox(height: 13),
                      Row(
                        children: [
                          Checkbox(
                              value: _isChecked,
                              onChanged: (bool? val) {
                                setState(() {
                                  _isChecked = val ?? false;
                                });
                              }),
                          Expanded(
                            child: Row(
                              children: [
                                Text("By Signing up, you agree"),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    " terms and condition",
                                    style: TextStyle(
                                      color: Color(0xff9B86BD),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Center(
                        child: TextButton(
                          onPressed: () async {
                            var name = nameController.text.toString();
                            var email = emailController.text.toString();
                            var password = passController.text.toString();
                            var shareprrf =
                                await SharedPreferences.getInstance();
                            shareprrf.setBool(SplashScreenState.KeyLogin, true);
                            shareprrf.setString(SplashScreenState.KeyName, name); // Store the name here
                            shareprrf.setString('email', email); 
                            shareprrf.setString('password', password); 
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavigation(
                                  name: name,email: email,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 17,
                                color: const Color.fromRGBO(255, 255, 255, 1)),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xff5A639C)),
                        ),
                      ),
                      SizedBox(height: 12),
                      Center(child: Text("Or")),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(color: Color(0xff5A639C)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
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
      ),
    );
  }
}
