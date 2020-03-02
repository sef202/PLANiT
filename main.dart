import 'package:flutter/material.dart';
import 'home_page.dart';
import 'task.dart';
import 'classes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLANit Login Screen',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Widget _buildUsername() {           // function for building/styling username field
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Container(                     // container for username box field
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFF2F4F4),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow (
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ], //boxShadow
          ),
          height: 60.0,
          child: TextField(          // text field to type in username/email
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.black87,
              ),
              hintText: 'Enter username',
              hintStyle: TextStyle(
                color: Colors.black12,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPassword() {            // function for building/styling password field
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Container(                     // container for password box field
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFF2F4F4),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow (
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ], //boxShadow
          ),
          height: 60.0,
          child: TextField(          // text field to type in password
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black87,
              ),
              hintText: 'Enter password',
              hintStyle: TextStyle(
                color: Colors.black12,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPassword() {              // function for building forgot password button
    return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
            onPressed: () => print('Forgot password button pressed'),
            padding: EdgeInsets.only(right: 0.0),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            )
        )
    );
  }

  Widget _buildLoginBtn() {                         // function for building login button
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: homepage,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(30.0),
          ),
          color: Colors.black87,
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: Color(0xFFF2F4F4),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        )
    );
  }

  Widget _buildCreateAcct() {                    // function for building create account button
    return GestureDetector(
      onTap: () => print('Create Account button pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have a login?  ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Create Account',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: <Widget>[
              Container( // container for login's background wallpaper
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [ // colors for gradient background of login page
                      Color(0xFFF2F4F4),
                      Color(0xFFE5E8E8),
                      Color(0xFFCCD1D1),
                      Color(0xFFB2BABB)
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container (                         // container for title text of login page
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 260.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'PLANiT',
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildUsername(),      // calls function to build username widget
                      SizedBox(height: 30.0),
                      _buildPassword(),
                      _buildForgotPassword(),
                      _buildLoginBtn(),
                      _buildCreateAcct(),
                    ],
                  ),
                ),
              )
            ])
    ); // Scaffold
  }
}

