import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_manager/bloc/product_bloc.dart'; // Ensure this import is correct
import 'package:personal_finance_manager/screens/profile.dart';
import 'package:personal_finance_manager/screens/splash_screen.dart'; // Ensure this import is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Personal Finance Manager',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff7776B3)),
          useMaterial3: true,
        ),

        home: SplashScreen(), 
        // home: Profile(
        //   name: '',
        // ),
      ),
    );
  }
}
