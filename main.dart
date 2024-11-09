import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());//app is constant.
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});//constructor for constant app.

  @override//build method returns widgets
  Widget build(BuildContext context) {
    return const MaterialApp(home:HomeActivity()); //not changeable
  }
}

class HomeActivity extends StatelessWidget{//activity page created
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(//content of a page in scaffold
      appBar: AppBar(title: Text("LU_Crafters"),backgroundColor: Colors.blue,),
      body: Text("LU crafters"),

    );
  }
}