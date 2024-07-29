import 'package:flutter/material.dart';
import 'package:personal_finance_manager/widgets/style.dart';

class Profilewidget extends StatelessWidget {
  final String name;

  const Profilewidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 167),
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(66)),
          color: Color(0xffE2BBE9)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              name,
              style: head4,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Color(0xff5A639C),
                ),
                Text(
                  "Location",
                  style: head5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "1500",
                      style: head4,
                    ),
                    Text(
                      "Income",
                      style: head5,
                    ),
                  ],
                ),
                SizedBox(
                  width: 18,
                 
                ),
                Column(
                  children: [
                    Text(
                      "300",
                      style: head4,
                    ),
                    Text(
                      "Expense",
                      style: head5,
                    ),
                  ],
                ),
                SizedBox(
                  
                  width: 18,
                ),
               Column(
                    children: [
                      Text(
                        "220.0",
                        style: head4,
                      ),
                      Text(
                        "Balance",
                        style: head5,
                      ),
                    ],
                  ),
                
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
