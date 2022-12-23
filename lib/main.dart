import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_project/screens/guest.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

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
      // home: AuthScreen(),
      // home: Therm(),
      home: GuestScreen(),
    );
  }
}
