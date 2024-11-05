import 'package:flutter/material.dart';
import 'package:flutter_on_boarding/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Set up your Goal',
        body: 'Track and follow what matters to you. Save for important things ',
        footer: const SizedBox(
          height: 45,
          width: 200,
        ),
        image: Center(

          child: Image.asset('assets/2.svg.jpeg',
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'Track your Spending',
        body: 'Track and Analyse spending immediately and automatically through our BudgetWallet Application',
        footer: const SizedBox(
          height: 45,
          width: 200,
        ),
        image: Center(
          child: Image.asset('assets/1.svg.jpeg',
            height: 200,
            width: 200,
            fit: BoxFit.contain,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'Budget your money',
        body: 'Build healthy financial habits.Control unnecessary expenses',
        footer:const SizedBox(
          height: 45,
          width: 200,
        ),
        image: Center(
          child: Image.asset('assets/3.svg.jpeg',
            height: 200,
            width: 200,
            fit: BoxFit.contain,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
  ];
  static  get context => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('BudgetWallet'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(10,10),
            color: Colors.blueAccent,
            activeSize: Size.square(15),
            activeColor: Colors.white10,
          ),
          showDoneButton: true,

          done: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
            child: Text('Start Now', style: TextStyle(fontSize: 15, color: Colors.white)),
          ),

          showSkipButton: true,
          skip: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
            child: Text('Skip', style: TextStyle(fontSize: 15, color: Colors.white)),
          ),
          showNextButton: true,
          next: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: Icon(Icons.arrow_forward, size: 20, color: Colors.white),
          ),
          onDone: () => onDone(context),
          onSkip: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
