import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green, // Ensures primary color is green
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green, // AppBar background color
          foregroundColor: Colors.white, // Text color on AppBar
        ),

      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

      ),
      themeMode: ThemeMode.light, // Force light theme to test colors
      debugShowCheckedModeBanner: false,
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LU_Crafters"),
      ),
      body: Center(
        child: Text(
          "LU crafters",

        ),
      ),
    );
  }
}
