import 'package:flutter/material.dart';

import '../widgets/curve_clipper.dart';
import './home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(this.appTitle, {Key? key}) : super(key: key);
  final String appTitle;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _inputField(
      {required String hintText,
      required IconData icon,
      required bool obscureText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              size: 30.0,
            )),
        obscureText: obscureText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: deviceHeight,
          child: Column(children: [
            // Image with Custom Clipper
            ClipPath(
              clipper: CurveClipper(),
              child: Image(
                image: const AssetImage('assets/images/login_background.jpg'),
                height: deviceHeight * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Name
            Text(
              widget.appTitle,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 34.0,
                letterSpacing: 10.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            _inputField(
                hintText: 'Username',
                icon: Icons.account_box,
                obscureText: false),
            _inputField(
                hintText: 'Password', icon: Icons.lock, obscureText: true),
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(HomeScreen.routeName),
              child: Container(
                height: 45.0,
                margin: const EdgeInsets.only(left: 60, right: 60, top: 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // todo Sign Up
              },
              child: Text.rich(
                TextSpan(children: [
                  const TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    // todo Sign Up
                  },
                  child: Container(
                    height: 80.0,
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    child: const Text(
                      'Don\'t have an account? Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            )

            // Username
            // Password
            // Login Button
            // Signup Prompt
          ]),
        ),
      ),
    ));
  }
}
