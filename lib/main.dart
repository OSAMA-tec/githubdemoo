
import 'package:flutter_on_boarding/Widget/bottomnavigationbar.dart';
import 'package:flutter_on_boarding/screens/homeMain.dart';
import 'package:flutter_on_boarding/screens/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_on_boarding/data/model/add_date.g.dart';
import 'package:flutter_on_boarding/iintroduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/model/add_date.dart';



bool show = true;

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const BudgetWallet());
}

class BudgetWallet extends StatelessWidget {
  const BudgetWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: IntroScreen(),
        routes: {

          '/home': (context) => Bottom(),
        }
    );
  }
}
