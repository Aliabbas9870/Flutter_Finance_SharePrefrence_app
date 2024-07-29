import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_finance_manager/widgets/finance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFinance extends StatefulWidget {
  const AddFinance({super.key});

  @override
  State<AddFinance> createState() => _AddFinanceState();
}

class _AddFinanceState extends State<AddFinance> {
  var selectindex = -1;
  var titleController = TextEditingController();
  var amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadSharedPreferencesData();
  }

  void loadSharedPreferencesData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? title = sharedPreferences.getString('title');
    String? amount = sharedPreferences.getString('amount');
    if (title != null && amount != null) {
      setState(() {
        finance.add(Finance(title: title, amount: amount));
      });
    }
  }

  List<Finance> finance = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 222, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 222, 240),
        iconTheme: IconThemeData(
          color: Color(0xff7776B3),
        ),
        centerTitle: true,
        title: Text(
          "Add Finance",
          style: GoogleFonts.roboto(
              color: Color(0xff7776B3),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Enter the expanse title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: amountController,

              keyboardType: TextInputType.number,
              // maxLength: 8,
              decoration: InputDecoration(
                  hintText: "Enter the amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 122,
                    decoration: BoxDecoration(
                        color: Color(0xff7776B3),
                        borderRadius: BorderRadius.circular(11)),
                    child: TextButton(
                        onPressed: () async {
                          var sharepref = await SharedPreferences.getInstance();

                          String title = titleController.text.trim();
                          String amount = amountController.text.trim();
                          sharepref.setString('title', title);
                          sharepref.setString('amount', amount);
                          if (title.isEmpty && amount.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Color(0xff9B86BD),
                                content: Text("Please Enter The Data.."),
                              ),
                            );
                          } else {
                            setState(() {
                              titleController.text = '';
                              amountController.text = '';
                              finance
                                  .add(Finance(title: title, amount: amount));
                              loadSharedPreferencesData();
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Color(0xff9B86BD),
                                content: Text("Data Add"),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white),
                        ))),
                Container(
                    width: 122,
                    decoration: BoxDecoration(
                        color: Color(0xff7776B3),
                        borderRadius: BorderRadius.circular(11)),
                    child: TextButton(
                        onPressed: () {
                          String title = titleController.text.trim();
                          String amount = amountController.text.trim();

                          setState(() {
                            titleController.text = '';
                            amountController.text = '';
                            finance[selectindex].title = title;
                            finance[selectindex].amount = amount;
                            selectindex = -1;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color(0xff9B86BD),
                              content: Text("Data Updated"),
                            ),
                          );
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white),
                        )))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            finance.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "No Data Yet...",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CircularProgressIndicator()
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: finance.length,
                        itemBuilder: (context, index) => getRow(index)),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Container(
      height: 88,
      child: Card(
        color: Color(0xff7776B3),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(finance[index].title.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 231, 227, 231))),
              Text(finance[index].amount.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 237, 235, 238))),
            ],
          ),
          leading: CircleAvatar(
              child: Icon(
            Icons.person,
            color: Color(0xff5A639C),
            size: 26,
          )),
          trailing: SizedBox(
            width: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      titleController.text = finance[index].title.toString();
                      amountController.text = finance[index].amount.toString();
                      setState(() {
                        selectindex = index;
                      });
                    },
                    child: Icon(Icons.edit,
                        color: Color.fromARGB(255, 234, 228, 235))),
                InkWell(
                  onTap: () {
                    setState(() {
                      finance.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color(0xff7776B3),
                        content: Text("Data Deleted"),
                      ),
                    );
                  },
                  child: Icon(Icons.delete,
                      color: Color.fromARGB(255, 232, 226, 233)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
