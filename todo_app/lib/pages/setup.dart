import 'package:flutter/material.dart';
import 'package:todo_app/data/auth_data.dart';
import 'package:todo_app/widgets/form.dart';
import 'package:todo_app/consts/sizes.dart';
import 'package:todo_app/widgets/images.dart';


class Setup extends StatefulWidget {
  final VoidCallback show;
  const Setup(this.show, {super.key});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final passwordConfirmController = TextEditingController();
  
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordConfirmFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {});
    });

    passwordFocusNode.addListener(() {
      setState(() {});
    });

    passwordConfirmFocusNode.addListener(() {
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
              size10,
              input('Confirm Password', Icons.password, passwordConfirmController,
                  passwordConfirmFocusNode),
              account("Have you an account?", "Login", widget.show),
              size50,
              loginButton("Sign Up",(){AuthenticationRemote().register(emailcontroller.text, passwordcontroller.text, passwordConfirmController.text);}),
              size10,
            ],
          ),
        ),
      ),
    );
  }
}