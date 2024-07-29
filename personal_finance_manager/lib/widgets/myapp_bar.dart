import 'package:flutter/material.dart';
import 'package:personal_finance_manager/screens/login_screen.dart';
import 'package:personal_finance_manager/widgets/style.dart';

class MyappBar extends StatelessWidget {
  const MyappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28),
      height: 135,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(66)),
          color: Color(0xff7776B3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: titleStyle,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(
              Icons.logout,
              color: Color(0xffE2BBE9),
            ),
          )
        ],
      ),
    );
  }
}
