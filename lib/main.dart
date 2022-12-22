import 'package:flutter/material.dart';
import 'package:login_project/screens/guest/auth.dart';
// import 'package:login_project/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Flutter',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthScreen(),
    );
  }
}
