import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_finance_manager/widgets/drawer.dart';
import 'package:personal_finance_manager/widgets/segment_btn.dart';
import 'package:personal_finance_manager/widgets/status_btn.dart';
import 'package:personal_finance_manager/widgets/style.dart';
import 'package:personal_finance_manager/widgets/subscription_row_home.dart';
import 'package:personal_finance_manager/widgets/upcomingrow.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String email;

  HomeScreen({required this.name, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSubscribe = true;
  List subarr = [
    {
      "name": "Medical",
      "price": "250",
    },
    {"name": "shopyfy", "price": "160"},
    {"name": "Youtube", "price": "429"},
    {"name": "Internet", "price": "753"},
    {"name": "Microsoft", "price": "405"},
  ];
  List bilarr = [
    {"name": "Internet", "price": "650"},
    {"name": "shopyfy", "price": "870"},
    {"name": "Youtube", "price": "329"},
    {"name": "PC", "price": "853"},
    {"name": "Microsoft", "price": "905"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 222, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 222, 240),
        iconTheme: IconThemeData(
          color: Color(0xff7776B3),
        ),
        centerTitle: true,
        title: Text(
          'Home Screen',
          style: GoogleFonts.roboto(
              color: Color(0xff7776B3),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MyDrawer(
        name: widget.name,
        email: widget.email,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 0.5,
              decoration: BoxDecoration(
                  color: Color(0xffE2BBE9).withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 70,
                    child: Center(
                      child: Text(
                        "PFM",
                        style: GoogleFonts.roboto(
                            color: Color(0xff7776B3),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: Center(
                      child: Text(
                        "PKR: 2000.00",
                        style: GoogleFonts.roboto(
                            color: Color(0xff7776B3),
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: StatusBtn(
                        title: 'Active',
                        statuscolor: Colors.green,
                        value: '322',
                        onPress: () {},
                      )),
                      Expanded(
                          child: StatusBtn(
                        title: 'higest',
                        statuscolor: Colors.red,
                        value: '1222',
                        onPress: () {},
                      )),
                      Expanded(
                          child: StatusBtn(
                        title: 'Lowest',
                        statuscolor: Colors.black26,
                        value: '222',
                        onPress: () {},
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffE2BBE9),
                  borderRadius: BorderRadius.circular(17)),
              child: Row(
                children: [
                  Expanded(
                      child: SegmentBtn(
                          title: "Your Subscription",
                          isActive: isSubscribe,
                          onPress: () {
                            setState(() {
                              isSubscribe = !isSubscribe;
                            });
                          })),
                  SizedBox(),
                  Expanded(
                      child: SegmentBtn(
                          title: "Upcoming bill",
                          isActive: isSubscribe,
                          onPress: () {
                            setState(() {
                              isSubscribe = !isSubscribe;
                            });
                          }))
                ],
              ),
            ),
            if (isSubscribe)
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shrinkWrap: true,
                  itemCount: subarr.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var sObj = subarr[index] as Map? ?? {};
                    return SubscriptionRowHome(sObj: sObj, onPress: () {});
                  }),
            if (!isSubscribe)
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shrinkWrap: true,
                  itemCount: bilarr.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var sObj = bilarr[index] as Map? ?? {};
                    return UpComingRowHome(sObj: sObj, onPress: () {});
                  }),
            Center(
              child: Text(
                'Welcome, ${widget.name}!',
                style: GoogleFonts.roboto(
                    color: Color(0xff7776B3),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
