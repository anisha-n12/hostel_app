import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:hostel_app/pages/complaintpage.dart';
import 'package:hostel_app/pages/homepage.dart';
import 'package:hostel_app/pages/rectorRegistration.dart';
import 'package:hostel_app/pages/studentallotment.dart';
import 'package:hostel_app/pages/wardenRegistration.dart';
// import 'package:hostel_app/pages/leaveapplication.dart';
import 'package:hostel_app/shared/constants.dart';
import 'package:hostel_app/widgets/widgets.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.primaryColor,
          title: const Text(
            "Welcome Admin",
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
                "Admin",
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
                onTap: () {
                  nextScreen(context, WardenRegistration());
                },
                selectedColor: Constants.primaryColor,
                selected: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("Warden Registration",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, RegisterRector());
                },
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("Rector Registration",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, AllotStudentList());
                },
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.check_box_rounded,
                  color: Colors.white,
                ),
                title: const Text("Student Allotment",
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
                const SizedBox(
                  height: 300,
                ),
                Builder(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          ListTile(
                            textColor: Colors.white,
                            title: Text("Photos"),
                            titleTextStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            enabled: false,
                            tileColor: Constants.primaryColor,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ]),
        ));
  }
}
