import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text(
        "Home Page",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      backgroundColor: const Color.fromARGB(255, 220, 212, 170),
      elevation: 0,
    ));
  }
}
