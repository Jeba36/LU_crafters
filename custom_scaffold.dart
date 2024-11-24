

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key,this.child});
   final Widget? child;
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
          SafeArea(
            child:child!,
          ),
        ],
      ),
    );
  }

}