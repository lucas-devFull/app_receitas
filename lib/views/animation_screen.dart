import 'package:app_receitas/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 68, 68),
      appBar: AppBar(
        title: const Text(style: TextStyle(color: Colors.white), "CookBook"),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      ),
      body: Center(
        child: Lottie.asset('assets/Animation.json'),
      ),
    );
  }
}
