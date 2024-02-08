import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    labelStyle: TextStyle(
      fontSize: 13,
      color: Colors.grey,
      // fontWeight: FontWeight.w300,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 220, 220, 170), width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 220, 220, 170), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 220, 220, 170), width: 2),
    ));

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}


void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 14)),
      backgroundColor: color,
      duration: Duration(seconds: 2),
      action: SnackBarAction(label: "Ok", onPressed: (){},textColor: Colors.white,),));
}
