import 'package:flutter/material.dart';
import 'package:todo_app/consts/sizes.dart';


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

