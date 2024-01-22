import 'package:flutter/material.dart';

class Profile_pg extends StatefulWidget {
  const Profile_pg({super.key});

  @override
  State<Profile_pg> createState() => _Profile_pgState();
}

class _Profile_pgState extends State<Profile_pg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Your Profile",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 220, 212, 170),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              color: Colors.black,
            )
          ],
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 410,
                    height: 300,
                    child: Image.asset(
                      "lib/assets/images/profile2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 43,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Name :",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white24))),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 43,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Email Id :",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white24))),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 43,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Hostel :",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white24))),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 43,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Room No :",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white24))),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 43,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Phone :",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white24))),
                        ),
                      ),
                      const SizedBox(height: 25),
                      MaterialButton(
                          onPressed: () {},
                          child: const Text("Logout"),
                          color: Colors.orange)
                    ],
                  ),
                )
              ],
            )));
  }
}
