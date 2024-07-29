import 'package:flutter/material.dart';

class SubscriptionRowHome extends StatelessWidget {
  final Map? sObj;
  final VoidCallback? onPress;

  const SubscriptionRowHome({
    super.key,
    required this.sObj,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff).withOpacity(0.18)),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(sObj?['name'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                width: 8,
              ),
              Text("PKR: " + sObj?['price'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
