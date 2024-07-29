import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_finance_manager/screens/login_screen.dart';
import 'package:personal_finance_manager/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  final String name;
  final String email;

  MyDrawer({required this.name, required this.email});

  Future<void> _logout(BuildContext context) async {
    var sharepref = await SharedPreferences.getInstance();
    await sharepref.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Center(
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                  child: Text("A A"),
                ),
                decoration: BoxDecoration(
                  color: Color(0xff7776B3),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xff7776B3)),
              title: Text(
                'Home',
                style: GoogleFonts.roboto(
                    color: Color(0xff7776B3),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Color(0xff7776B3)),
              title: Text(
                'Settings',
                style: GoogleFonts.roboto(
                    color: Color(0xff7776B3),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: Icon(Icons.logout, color: Color(0xff7776B3)),
                title: Text(
                  'Logout',
                  style: GoogleFonts.roboto(
                      color: Color(0xff7776B3),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => _logout(context) // Close the drawer on tap
        
                ),
          ],
        ),
      ),
    );
  }
}
