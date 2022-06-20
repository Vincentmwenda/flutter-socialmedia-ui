import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';
import './screens/login_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _appName = 'Flutter Social UI';
  static const String _appTitle = 'JOVIS';
  static const MaterialColor _appPrimaryColor = Colors.blue;
  // static const MaterialColor _appPrimaryColor = Colors.purple;
  static const _defaultScreen = LoginScreen(_appTitle);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: _appPrimaryColor,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: _appPrimaryColor,
          )),
      home: _defaultScreen,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(_appTitle),
        ProfileScreen.routeName: (_) => const ProfileScreen(_appTitle),
      },
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => _defaultScreen,
      ),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => _defaultScreen,
      ),
    );
  }
}
