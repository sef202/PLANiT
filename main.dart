import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_page.dart';
import 'register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PLANit Login Screen',
      home: LoginPage(),
      routes: {
        "/login": (_) => new MyHomePage(),
        "/logout": (_) => new LoginPage(),
      },
    );
  }
}
