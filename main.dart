import 'package:flutter/material.dart';
import 'package:planit/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLANit Login Screen',
      home: LoginPage(),    // calls LoginPage() from login_screen.dart to build login screen
    );
  }
}

// class for app's home page - this is where the login button navigates to when pressed
// this is a temporary class until the homepage is created, then onPressed() function
// will change in _buildLoginBtn
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PLANiT Homepage'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //navigate back to login screen
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

// class for app's create account page - this is where the create account button
// navigates to when pressed
// this is a temporary class until the create account page is created, then the
// onPressed() function will change in _buildCreateAcct
class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //navigate back to login screen
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

// class for app's forgot password page - this is where the forgot password button
// navigates to when pressed
// this is a temporary class until the forgot password page is created, then the
// onPressed() function will change in _buildCreateAcct
class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //navigate back to login screen
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

