import 'package:flutter/material.dart';
import 'package:hostel_app/pages/complaintpage.dart';
import 'package:hostel_app/pages/homeinfo.dart';
import 'package:hostel_app/pages/homepage.dart';
import 'package:hostel_app/pages/leaveapplication.dart';
import 'package:hostel_app/pages/room_change.dart';
import 'package:hostel_app/service/database_service.dart';
import 'package:hostel_app/shared/constants.dart';
import 'package:hostel_app/widgets/widgets.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  
  String name = "";
  String room = "";
  String placeToVisit = "";
  String mobilenum = "";
  String parent_contact = "";
  String reason = "";
  String id = "";
  DateTime inTimeStamp = DateTime.now();
  DateTime outTimeStamp = DateTime.now();
  DateTime attendance = DateTime.now();
  bool indone = false;
  bool outdone = false;
  bool attendancedone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.primaryColor,
          title: const Text(
            "Welcome Student",
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
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                title: const Text("Complaint Box",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, Room_change());
                },
                selectedColor: Constants.primaryColor,
                selected: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                ),
                title: const Text("Room Change",
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, LeaveApp());
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
                                nextScreenReplace(context, HomePage());
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
                const SizedBox(height: 30),
                NoticeBoard(),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    "MARK ATTENDANCE",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                          const ListTile(
                            textColor: Colors.white,
                            title: Text("12/09/2023"),
                            titleTextStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            subtitle: Text("Wednesday, 9:48 pm"),
                            subtitleTextStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                            enabled: false,
                            tileColor: Colors.green,
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                              readOnly: true,
                              controller: TextEditingController(
                                text: attendancedone
                                    ? "${attendance.toLocal()}".substring(
                                        0,
                                        "${attendance.toLocal()}".indexOf(
                                            ':',
                                            "${attendance.toLocal()}"
                                                    .indexOf(':') +
                                                1))
                                    : "",
                              ),
                              decoration: textInputDecoration.copyWith(
                                  labelText:
                                      "Click button to mark attendance")),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (!attendancedone) {
                                setState(() {
                                  attendance = DateTime.now();
                                });

                                attendancedone = true;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: Text("Mark me OUT"),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          "MARK IN/OUT",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Location :",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field can\'t be empty!';
                          }
                          return null;
                        },
                        controller: TextEditingController(
                          text: placeToVisit,
                        ),
                        onChanged: (value) {
                          placeToVisit = value;
                        },
                        decoration: textInputDecoration.copyWith(
                          labelText: "Location",
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Reason :",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: TextEditingController(
                          text: reason,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field can\'t be empty!';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          reason = value;
                        },
                        decoration: textInputDecoration.copyWith(
                          labelText: "Reason",
                        ),
                      ),
                  
              
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () async {
                          DatabaseService.addInOutData(name, mobilenum, room,
                              placeToVisit, reason, parent_contact);
                          showSnackBar(context, Colors.green,
                              "Successfully added entry!\nPlease mark yourself In/Out...");
                          // nextScreenReplace(context, StudentPage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Add entry",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                  text: indone
                                      ? "${inTimeStamp.toLocal()}".substring(
                                          0,
                                          "${inTimeStamp.toLocal()}".indexOf(
                                              ':',
                                              "${inTimeStamp.toLocal()}"
                                                      .indexOf(':') +
                                                  1))
                                      : "",
                                ),
                                decoration: textInputDecoration.copyWith(
                                    labelText: "Click button to mark IN")),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (!indone) {
                                setState(() {
                                  inTimeStamp = DateTime.now();
                                });

                                indone = true;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: Text("Mark me IN   "),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                  text: outdone
                                      ? "${outTimeStamp.toLocal()}".substring(
                                          0,
                                          "${outTimeStamp.toLocal()}".indexOf(
                                              ':',
                                              "${outTimeStamp.toLocal()}"
                                                      .indexOf(':') +
                                                  1))
                                      : "",
                                ),
                                decoration: textInputDecoration.copyWith(
                                    labelText: "Click button to mark OUT")),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (!outdone) {
                                setState(() {
                                  outTimeStamp = DateTime.now();
                                });
                                outdone = true;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: Text("Mark me OUT"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50)
                    ],
                  ),
                ),
              ]),
        ));
  }
}
