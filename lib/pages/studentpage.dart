import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:hostel_app/pages/complaintpage.dart';
import 'package:hostel_app/pages/homeinfo.dart';
import 'package:hostel_app/pages/homepage.dart';
import 'package:hostel_app/pages/leaveapplication.dart';
import 'package:hostel_app/pages/profile_pg.dart';
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
  String block = "";
  String mobilenum = "";
  String email = "";
  String placeToVisit = "";
  String reason = "";
  String parent_contact = "";
  DateTime inTimeStamp = DateTime.now();
  DateTime outTimeStamp = DateTime.now();
  DateTime attendance = DateTime.now();
  bool indone = false;
  bool outdone = false;
  bool attendancedone = false;
  var date = DateTime.now();
  bool marked = false;
  late DateTime presentDate;
  late DateTime allowedStartTime;
  late DateTime allowedEndTime;
  late DateTime timeMarked;
  @override
  void initState() {
    super.initState();
    presentDate = DateTime.now();
    _updateTimeRange();
  }

  void _updateTimeRange() {
    allowedStartTime =
        DateTime(presentDate.year, presentDate.month, presentDate.day, 21, 0);
    allowedEndTime =
        DateTime(presentDate.year, presentDate.month, presentDate.day, 22, 0);
  }

  bool checkboundary(double latitude, double longitude) {
    //co ordinates for vjtti
    double vjtiLatitude = 19.021996;
    double vjtiLongitude = 72.856845;

    double threshold = 0.001;
    bool withinboundary = (latitude >= vjtiLatitude - threshold &&
            latitude <= vjtiLatitude + threshold) &&
        (longitude >= vjtiLongitude - threshold &&
            longitude <= vjtiLongitude + threshold);

    if (!withinboundary) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error !!!"),
              content: Text(
                  'You must be within the boundary of V.J.T.I. College to mark attendance.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(color: Colors.brown),
                    ))
              ],
            );
          });
    }
    return withinboundary;
  }

  void storeAttendanceInFirebase() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      String attendanceId =
          FirebaseFirestore.instance.collection('students').doc().id;

      await FirebaseFirestore.instance
          .collection('students')
          .doc(user?.uid)
          .collection('attendanceTime')
          .doc(attendanceId)
          .set({
        'timestamp': Timestamp.fromDate(timeMarked),
      });

      print('Attendance stored in Firestore.');
    } catch (error) {
      print('Error storing attendance in Firestore: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    getuserdata();

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
                "$name",
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
                      Profile_pg(
                        name: name,
                        block: block,
                        room: room,
                        mobile: mobilenum,
                        email: email,
                        parentContact: parent_contact,
                      ));
                },
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
                                DatabaseService.signOutAndReset();
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
                SizedBox(height: 30),
                NoticeBoard(),
                SizedBox(height: 30),
                Center(
                  child: Container(
                    height: 230,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.brown, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(children: [
                        const Text(
                          'Mark Regular Attendance',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.brown),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2),
                        const Text(
                          "Timmings : 9:00pm - 10:00pm\nTurn on location while marking present",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepOrangeAccent),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                "Today: ${date.day}-${date.month}-${date.year}",
                                style: const TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: Row(children: [
                            Switch(
                              value: marked,
                              onChanged: (bool value) async {
                                while (true) {
                                  var status = await Permission.location.status;
                                  if (status != PermissionStatus.granted) {
                                    await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                'Requires Location to mark attendance'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Ok',
                                                    style: TextStyle(
                                                        color: Colors.brown),
                                                  )),
                                            ],
                                          );
                                        });
                                    await Permission.location.request();
                                  } else {
                                    break;
                                  }
                                  Position position =
                                      await Geolocator.getCurrentPosition(
                                          desiredAccuracy:
                                              LocationAccuracy.high);
                                  bool iswithinBoundary = checkboundary(
                                      position.latitude, position.longitude);
                                  DateTime currentTime = DateTime.now();
                                  if (currentTime.isAfter(allowedStartTime) &&
                                      currentTime.isBefore(allowedEndTime) &&
                                      !marked &&
                                      iswithinBoundary) {
                                    setState(() {
                                      marked = value;
                                      if (marked) {
                                        timeMarked = DateTime.now();
                                        storeAttendanceInFirebase();
                                      }
                                    });
                                  }
                                }
                              },
                              activeColor:
                                  const Color.fromARGB(255, 132, 209, 172),
                              inactiveTrackColor:
                                  const Color.fromARGB(255, 248, 198, 122),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Mark my Today's Attendance",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                        ),
                        if (marked)
                          SizedBox(
                            height: 2,
                          ),
                        if (marked)
                          Text(
                              "Marked at : ${DateFormat('HH:mm:ss').format(timeMarked)}",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 163, 145, 96),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ))
                      ]),
                    ),
                  ),
                ),
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
                      const SizedBox(height: 20),
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
                    ],
                  ),
                ),
              ]),
        ));
  }

  Future<void> getuserdata() async {
    Map<String, dynamic>? studentData =
        await DatabaseService.getCurrentUserData();
    setState(() {
      name = studentData!['name'];
      room = studentData['room'];
      block = studentData['block'];
      mobilenum = studentData['mobile'];
      parent_contact = studentData['parentMobile'];
      email = studentData['email'];
    });
  }
}
