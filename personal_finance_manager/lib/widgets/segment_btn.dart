import 'package:flutter/material.dart';

class SegmentBtn extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool isActive;
  const SegmentBtn(
      {super.key,
      required this.title,
      required this.onPress,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onPress,
      child: Container(
        height: media.width * 0.5,
        decoration: isActive
            ? BoxDecoration(
                border: Border.all(
                    color:
                        Color(0xff).withOpacity(0.18)),
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffE2BBE9).withOpacity(0.3),
              )
            : null,
        alignment: Alignment.center,
        child: Text(title,
            style: TextStyle(
                color: isActive
                    ? Colors.black
                    : Color.fromARGB(255, 134, 133, 187),
                fontSize: 12,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
