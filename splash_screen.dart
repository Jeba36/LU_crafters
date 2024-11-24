import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signin_screen.dart'; // Import your SignInScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to SignInScreen after a 2-second delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1, // Adjust opacity as needed (0.0 to 1.0)
            child: Image.asset(
              'assets/images/2000e95c-16e0-4c68-9e4c-33b9ed78d6c1.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Image.asset(
            'assets/images/logo.jpg',
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: double.infinity,
            alignment:Alignment.center ,
          ),
          const SafeArea(
            child: Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
