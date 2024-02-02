import 'package:flutter/material.dart';
import 'package:hostel_app/pages/getdata.dart';
import 'package:hostel_app/pages/getinoutdata.dart';
import 'package:hostel_app/pages/guestRecord.dart';
import 'package:hostel_app/pages/in_out_details.dart';
import 'package:hostel_app/pages/rectorProfile.dart';
import 'package:hostel_app/pages/room_change_list.dart';
import 'package:hostel_app/pages/roomchange_application_list.dart';
// import 'package:hostel_app/pages/complaintpage.dart';
// import 'package:hostel_app/pages/homepage.dart';
// import 'package:hostel_app/shared/constants.dart';
// import 'package:hostel_app/widgets/widgets.dart';

class RectorPage extends StatefulWidget {
  const RectorPage({super.key});

  @override
  State<RectorPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<RectorPage> {
  static const primaryColor = Color.fromARGB(255, 220, 220, 170);
  static const secondaryColor = Color.fromARGB(255, 159, 137, 125);
  void nextScreen(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          title: const Text(
            "Welcome Rector",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: secondaryColor,
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
                onTap: () {
                  nextScreen(
                      context,
                      RectorProfile(
                        username: 'Rector1',
                      ));
                },
                selectedColor: primaryColor,
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
                onTap: () {},
                selectedColor: primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                title: const Text("Guest Record",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, const GuestRecord());
                },
                selectedColor: primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                title: const Text("Allotments",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, RoomChangeList());
                },
                selectedColor: primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                title: const Text("Check Room Change Application",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, GetUserData());
                },
                selectedColor: primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                title: const Text("Check Leave Application",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  // nextScreen(context, ComplaintBox());
                },
                selectedColor: primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                title: const Text("Check Complaint Box",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, GetInOutData());
                },
                selectedColor: primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("In/Out Entries",
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
                                // nextScreenReplace(context, HomePage());
                                // await authService.signOut();
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const LoginPage()),
                                //     (route) => false);
                              },
                              icon: Icon(Icons.done),
                              color: Colors.green,
                            )
                          ],
                        );
                      });
                },
                selectedColor: primaryColor,
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
                  width: 200,
                ),
              ]),
        ));
  }
}
