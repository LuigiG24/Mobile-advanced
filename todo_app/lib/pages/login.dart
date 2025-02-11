import 'package:flutter/material.dart';
import 'package:todo_app/data/auth_data.dart';
import 'package:todo_app/widgets/form.dart';
import 'package:todo_app/consts/sizes.dart';
import 'package:todo_app/widgets/images.dart';

class Login extends StatefulWidget {
  final VoidCallback show;
  const Login(this.show, {super.key});

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
      backgroundColor: Colors.white,
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
              account("Don't you have an account?", "Sign Up", widget.show),
              size50,
              loginButton("Login", (){AuthenticationRemote().login(emailcontroller.text, passwordcontroller.text);}),
              size10,
            ],
          ),
        ),
      ),
    );
  }
}

