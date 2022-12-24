import 'package:flutter/material.dart';
import 'package:login_project/screens/guest.dart';
import 'package:login_project/screens/services/user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page d'accueil"),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                await _userService.logout();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GuestScreen(),
                    ),
                    (route) => false);
              },
              child: const Text("Se déconnecter")),
        ),
      ),
    );
  }
}
