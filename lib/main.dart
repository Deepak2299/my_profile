import 'package:flutter/material.dart';
import 'package:my_profile/contants.dart';
import 'package:my_profile/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
//        scaffoldBackgroundColor: KPrimaryColor.withOpacity(0.5),
        primaryColor: KPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: KTextColor),
      ),
      home: HomeScreen(),
    );
  }
}
