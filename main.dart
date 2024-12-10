import 'package:app1/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // For `kIsWeb`

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAqTr3diaVvMPr2DDaBNyhtBEePkWdhABs",
        authDomain: "lu-crafters-719da.firebaseapp.com",
        projectId: "lu-crafters-719da",
        storageBucket: "lu-crafters-719da.appspot.com",
        messagingSenderId: "721149580896",
        appId: "1:721149580896:web:cab7b89dc6d16d0a541505",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
