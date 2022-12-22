import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const HomePageScreen({super.key, required this.onChangedStep});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Page d'accueil",
            ),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () => widget.onChangedStep(0),
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            children: const [
              Text("Hello World"),
            ],
          ),
        ),
      ),
    );
  }
}
