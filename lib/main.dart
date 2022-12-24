import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_project/screens/dashboard/home.dart';
import 'package:login_project/screens/guest.dart';
import 'package:login_project/screens/services/user_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Flutter',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const GuestScreen();
          }
          return const SafeArea(
              child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                "Loading...",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ));
        },
      ),
    );
  }
}
