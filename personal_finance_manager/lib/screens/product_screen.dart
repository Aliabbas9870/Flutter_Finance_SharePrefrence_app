import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic>? dataList;

  Future<void> hitApi() async {
    var respons =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (respons.statusCode == 200) {
      setState(() {
        dataList = jsonDecode(respons.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    hitApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 222, 240),
      appBar: AppBar(
        title: Text('Product Screen'),
        backgroundColor: Color.fromARGB(255, 237, 222, 240),
      ),
      body: dataList == null
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: dataList!.length,
              itemBuilder: (context, index) {
                final product = dataList![index];
                return ListTile(
                  leading: CircleAvatar(
                      child: Image.network(product['image'],
                          width: 80, height: 80)),
                  title: Text(product['title']),
                  subtitle: Text('\$${product['price']}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
    );
  }
}
