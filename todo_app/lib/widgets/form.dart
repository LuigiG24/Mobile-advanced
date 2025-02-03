import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/consts/sizes.dart';


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