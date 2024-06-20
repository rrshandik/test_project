import 'package:flutter/material.dart';
import 'package:flutter_suit_question1_dika/view/firstscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
      ),
      home:  first_screen(),
    );
  }
}
