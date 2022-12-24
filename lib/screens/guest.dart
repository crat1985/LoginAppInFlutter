import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_project/models/user_model.dart';
import 'package:login_project/screens/dashboard/home.dart';
import 'package:login_project/screens/guest/auth.dart';
import 'package:login_project/screens/guest/password.dart';
import 'package:login_project/screens/guest/therm.dart';
import 'package:login_project/screens/services/common_service.dart';
import 'package:login_project/screens/services/user_service.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  final UserService _userService = UserService();
  final CommonService _commonService = CommonService();

  List<Widget> _widgets = [];
  int _indexSelected = 0;
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();

    _commonService.terms.then(
      (terms) {
        setState(
          () {
            _widgets.addAll(
              [
                AuthScreen(
                    onChangedStep: (int index, String email) => setState(() {
                          _indexSelected = index;
                          _email = email;
                        })),
                Therm(
                    terms: terms,
                    onChangedStep: (int index) =>
                        setState(() => _indexSelected = index)),
                PasswordScreen(
                  onChangedStep: (int? index, String? password) => setState(
                    () {
                      if (index != null) {
                        _indexSelected = index;
                      }
                      if (password != null) {
                        _userService
                            .auth(UserModel(email: _email, password: password))
                            .then(
                          (value) {
                            if (value.uid != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.isEmpty
          ? const SafeArea(
              child: Scaffold(
              body: Center(child: Text("Chargement...")),
            ))
          : _widgets.elementAt(_indexSelected),
    );
  }
}
