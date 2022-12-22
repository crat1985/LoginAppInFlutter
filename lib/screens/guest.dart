import 'package:flutter/material.dart';
import 'package:login_project/screens/guest/auth.dart';
import 'package:login_project/screens/guest/connected.dart';
import 'package:login_project/screens/guest/password.dart';
import 'package:login_project/screens/guest/therm.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  List<Widget> widgets = [];
  int _indexSelected = 0;
  @override
  void initState() {
    super.initState();
    widgets.addAll(
      [
        AuthScreen(
            onChangedStep: (int index) =>
                setState(() => _indexSelected = index)),
        Therm(
            onChangedStep: (int index) =>
                setState(() => _indexSelected = index)),
        PasswordScreen(
            onChangedStep: (int index) =>
                setState(() => _indexSelected = index)),
        HomePageScreen(
            onChangedStep: (int index) =>
                setState(() => _indexSelected = index)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widgets.elementAt(_indexSelected),
    );
  }
}
