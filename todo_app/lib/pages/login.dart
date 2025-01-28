import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {});
    });

    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              image(),
              SizedBox(height: 50),
              input('Email', Icons.email, emailcontroller, emailFocusNode),
              SizedBox(height: 10),
              input('Password', Icons.password, passwordcontroller,
                  passwordFocusNode),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding input(String typeName, IconData icon,
      TextEditingController controller, FocusNode focusNode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? focusedColor : borderColor,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor, width: 2.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: focusedColor, width: 2.0)),
          ),
        ),
      ),
    );
  }

  Padding image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login_header.png'),
          ),
        ),
      ),
    );
  }
}
