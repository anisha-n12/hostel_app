// ignore: file_names
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/pages/complaintWarden.dart';
import 'package:hostel_app/pages/complaintpage.dart';
import 'package:hostel_app/pages/getdata.dart';
import 'package:hostel_app/pages/homepage.dart';
import 'package:hostel_app/pages/leaveapplication.dart';
import 'package:hostel_app/shared/constants.dart';
import 'package:hostel_app/widgets/widgets.dart';

class WardenPage extends StatefulWidget {
  const WardenPage({super.key});

  @override
  State<WardenPage> createState() => _WardenPageState();
}

class _WardenPageState extends State<WardenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.primaryColor,
          title: const Text(
            "Welcome Warden ABC",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Constants.secondaryColor,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50),
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Username",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                height: 2,
              ),
              ListTile(
                onTap: () {},
                selectedColor: Constants.primaryColor,
                selected: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                title: const Text("View Profile",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, ComplaintBox());
                },
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("BLOCK A",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {},
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("BLOCK B",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {},
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("BLOCK C",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {},
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("BLOCK D",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                tileColor: Colors.blueGrey,
                onTap: () {},
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("BLOCK E",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreenReplace(context, GetUserData());
                },
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("Leave Application",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                tileColor: Colors.red,
                onTap: () async {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Are you sure you want to Logout?"),
                          title: Text("Log Out"),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.cancel,
                              ),
                              color: Colors.red,
                            ),
                            IconButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                showSnackBar(context, Colors.green,
                                    "Logged out successfully!");
                                nextScreenReplace(context, HomePage());
                                
                              },
                              icon: Icon(Icons.done),
                              color: Colors.green,
                            )
                          ],
                        );
                      });
                },
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: const Text("Log out",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   width: 200,
                // ),
                Image.asset(
                  "lib/assets/images/vjti1.png",
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Constants.secondaryColor,
                  width: 400.0,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/assets/images/hurry.png",
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topCenter,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Mark Attendance",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Constants.secondaryColor,
                  width: 400.0,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/assets/images/hurry.png",
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topCenter,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Guest List",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Constants.secondaryColor,
                  width: 400.0,
                  height: 50.0,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to ComplaintWarden page
                      nextScreen(context, ComplaintWarden());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "lib/assets/images/hurry.png",
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.topCenter,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Complaint box",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ));
  }
}
