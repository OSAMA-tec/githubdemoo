import 'package:flutter/material.dart';
import 'package:flutter_on_boarding/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    _buildPage(
      title: 'Set up your Goal',
      body: 'Track and follow what matters to you. Save for important things.',
      imagePath: 'assets/2.svg.jpeg',
      titleFontSize: 35.0,
      bodyFontSize: 20.0,
    ),
    _buildPage(
      title: 'Track your Spending',
      body: 'Track and analyse spending automatically through our BudgetWallet App.',
      imagePath: 'assets/1.svg.jpeg',
      titleFontSize: 30.0,
      bodyFontSize: 18.0,
    ),
    _buildPage(
      title: 'Budget your Money',
      body: 'Build healthy financial habits. Control unnecessary expenses.',
      imagePath: 'assets/3.svg.jpeg',
      titleFontSize: 30.0,
      bodyFontSize: 20.0,
    ),
  ];

  static PageViewModel _buildPage({
    required String title,
    required String body,
    required String imagePath,
    required double titleFontSize,
    required double bodyFontSize,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Center(child: Image.asset(imagePath)),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: bodyFontSize),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 100, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            size: Size(10, 10),
            color: Color(0xFF07574B),
            activeSize: Size.square(15),
            activeColor: Color(0xFF086E5D),
          ),
          showDoneButton: true,
          done: _buildButton('Start Now'),
          showSkipButton: true,
          skip: _buildButton('Skip'),
          showNextButton: true,
          next: _buildNextButton(),
          onDone: () => _onDone(context),
          onSkip: () => _onDone(context),
          // curve: Curves.bounceOut,
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFF07574B),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF07574B),
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(8),
      child: Icon(Icons.arrow_forward, size: 28, color: Colors.white),
    );
  }

  Future<void> _onDone(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
