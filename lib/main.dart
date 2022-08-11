import 'package:flutter/material.dart';
import 'package:movie_app/Screens/LoginScreen.dart';
import 'package:movie_app/Screens/MovieScreen.dart';
import 'package:movie_app/Screens/RegisterScreen.dart';

import './MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        MovieScreen.routeName:(context) => MovieScreen(),
        Login.routeName:(context)=>Login(),
        RegisterUp.routeName:(context)=>RegisterUp(),
      },
      home: const MyHomePage(),
    );
  }
}
