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

  String? emailError;
  String? passwordError;
  String? passwordMatchError;

  // Email validation function
  bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  // Password validation function
  bool isValidPassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
    return passwordRegex.hasMatch(password);
  }

    bool isPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  void validateInputs() {
    setState(() {
      emailError =
          isValidEmail(emailcontroller.text) ? null : "Invalid Email Format";
      passwordError = isValidPassword(passwordcontroller.text)
          ? null
          : "Password must be 6+ chars, 1 uppercase, 1 number, 1 special char";

      passwordMatchError = isPasswordsMatch(passwordcontroller.text, passwordConfirmController.text)
          ? null
          : "Passwords do not match";
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
              input('Email', Icons.email, emailcontroller, emailFocusNode, (value) => validateInputs(), emailError),
              size10,
              input('Password', Icons.password, passwordcontroller,
                  passwordFocusNode, (value) => validateInputs(), passwordError),
              size10,
              input('Confirm Password', Icons.password,
                  passwordConfirmController, passwordConfirmFocusNode,(value) => validateInputs(), passwordMatchError),
              account("Have you an account?", "Login", widget.show),
              size50,
              loginButton("Sign Up", () {
                AuthenticationRemote().register(emailcontroller.text,
                    passwordcontroller.text, passwordConfirmController.text);
              }),
              size10,
            ],
          ),
        ),
      ),
    );
  }
}
