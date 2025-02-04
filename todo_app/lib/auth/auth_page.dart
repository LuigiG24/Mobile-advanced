import 'package:flutter/material.dart';
import 'package:todo_app/pages/login.dart';
import 'package:todo_app/pages/setup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ super.key });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isLogin = true;

  void to(){
    setState(() {
    isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == true) {
      return Login(to);
    } else {
      return Setup(to);
    }
  }
}