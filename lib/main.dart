
import 'package:flutter/material.dart';
import 'package:flutter_on_boarding/home_screen.dart';
import 'package:flutter_on_boarding/iintroduction_screen.dart';
import 'package:flutter_on_boarding/splash_screen.dart';

bool show = true;
void main() {
  runApp(const BudgetWallet());
}

class BudgetWallet extends StatelessWidget {
  const BudgetWallet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BudgetWallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );

  }

}
