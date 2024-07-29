import 'package:flutter/material.dart';

class StatusBtn extends StatelessWidget {
  final String title;
  final Color statuscolor;
  final String value;
  final VoidCallback onPress;

  StatusBtn(
      {super.key,
      required this.title,
      required this.statuscolor,
      required this.value,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onPress,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Container(
              height: 60,
              width: 166,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff9B86BD).withOpacity(0.18)),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Color(0xff5A639C),
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                  Text(value,
                      style: TextStyle(
                          color: Color(0xff5A639C),
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 2,
              width: 60,
              color: statuscolor,
            ),
          )
        ],
      ),
    );
  }
}
