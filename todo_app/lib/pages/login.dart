import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/consts/sizes.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              image(),
              size50,
              input('Email', Icons.email, emailcontroller, emailFocusNode),
              size10,
              input('Password', Icons.password, passwordcontroller,
                  passwordFocusNode),
              account(),
              size50,
              loginButton(),
              size10,
            ],
          ),
        ),
      ),
    );
  }

  Padding loginButton() {
    return Padding(
              padding:  symmetric15,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: focusedColor,
                  borderRadius: Radius10,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
  }

  Padding account() {
    return  Padding(
      padding: symmetric15,
      child: const Row(
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
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Padding input(String typeName, IconData icon,
      TextEditingController controller, FocusNode focusNode) {
    return Padding(
      padding:  symmetric15,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: const TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? focusedColor : borderColor,
            ),
            contentPadding:symmetircHV,
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
                borderRadius: Radius10,
                borderSide: BorderSide(color: borderColor, width: 2.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: Radius10,
                borderSide: BorderSide(color: focusedColor, width: 2.0)),
          ),
        ),
      ),
    );
  }

  Padding image() {
    return Padding(
      padding:  symmetric15,
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login_header.png'),
          ),
        ),
      ),
    );
  }
}
