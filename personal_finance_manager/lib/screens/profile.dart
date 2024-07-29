import 'package:flutter/material.dart';
import 'package:personal_finance_manager/widgets/myapp_bar.dart';
import 'package:personal_finance_manager/widgets/profileWidget.dart';

class Profile extends StatefulWidget {
  final String name;

  Profile({required this.name});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 222, 240),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 12,
              ),
              Profilewidget(
                name: widget.name,
              ),
              MyappBar(),
            ],
          )
        ],
      ),
    );
  }
}
