import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Home",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    body:Column(children: [
        Container(
          child: ElevatedButton(
            onPressed:(){},
            style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
            child: const Text("Login"),
    ),),
    Container(
      child: ListView.builder(itemBuilder: (context,index){
        return Marquee(text: "hi");
      },)
    ),]),);
  }
}