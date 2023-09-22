import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/screen/home_screen.dart';
import 'package:store_api_flutter_course/screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: SingupPage(),
    );
  }
}