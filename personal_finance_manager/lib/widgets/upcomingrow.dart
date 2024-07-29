import 'package:flutter/material.dart';

class UpComingRowHome extends StatelessWidget {
  final Map? sObj;
  final VoidCallback? onPress;

  const UpComingRowHome({
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Color(0xffE2BBE9).withOpacity(0.18)),
                      color: Colors.grey.withOpacity(0.4)),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text("Jun",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w500)),
                      Text("26",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
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
