import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/consts/sizes.dart';


  Padding loginButton(text, VoidCallback onPressed) {
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
                child:  GestureDetector(
                  onTap: onPressed,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
  }

  Padding account(message, buttonName, show) {
    return  Padding(
      padding: symmetric15,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: show,
            child: Text(
              buttonName,
              style: const TextStyle(
                  color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  
 
  Padding input(String typeName, IconData icon,
      TextEditingController controller, FocusNode focusNode,Function(String)? onChanged, String? errorText,bool isPassword) {
    return Padding(
      padding:  symmetric15,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged:  onChanged,
          obscureText: isPassword,
          style: const TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? focusedColor : borderColor,
            ),
            contentPadding: symmetricHV,
            hintText: typeName,
            errorText: errorText,
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

  
Padding titleWidget(
    String typeName, TextEditingController controller, FocusNode focusNode) {
  return Padding(
    padding: symmetric15,
    child: Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: symmetricHV,
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

Padding subtitleWidget(
    String typeName, TextEditingController controller, FocusNode focusNode) {
  return Padding(
    padding: symmetric15,
    child: Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: TextField(
        maxLines: 4,
        controller: controller,
        focusNode: focusNode,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: symmetricHV,
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
