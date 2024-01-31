import 'package:flutter/material.dart';
import 'package:hostel_app/pages/studentpage.dart';
import 'package:hostel_app/service/database_service.dart';
import 'package:hostel_app/shared/constants.dart';
import 'package:hostel_app/widgets/widgets.dart';

class LeaveApp extends StatefulWidget {
  LeaveApp({Key? key}) : super(key: key);

  @override
  State<LeaveApp> createState() => _LeaveAppState();
}

class _LeaveAppState extends State<LeaveApp> {
  DateTime departureSelectedDate = DateTime.now();
  DateTime arrivalSelectedDate = DateTime.now();
  String name = "";
  String mobilenum = "";
  String placeToVisit = "";
  String personToVisit = "";
  String guardian_contact = "";
  String reason = "";
  String duration = "";
  String from = "";
  String to = "";
  String room = "";
  Future<void> _arrivalselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: arrivalSelectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != arrivalSelectedDate) {
      setState(() {
        arrivalSelectedDate = picked;
        to = "${arrivalSelectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _departselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: departureSelectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != departureSelectedDate) {
      setState(() {
        departureSelectedDate = picked;
        from = "${departureSelectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        title: const Text(
          "Leave Application",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Name :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // obscureText: true,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Enter Correct Name';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  name = value;
                },
                decoration: textInputDecoration.copyWith(
                  labelText: "Name",
                  // onChanged: ,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Mobile no. :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // obscureText: true,
                onChanged: (value) {
                  mobilenum = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(\+91[\s-]?)?(\d{10})$').hasMatch(value)) {
                    return 'Enter Correct Contact';
                  } else {
                    return null;
                  }
                },
                decoration: textInputDecoration.copyWith(
                  labelText: "Mobile",
                  // onChanged: ,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Block and room number :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || !RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter Block and room number!';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  room = value;
                },
                // obscureText: true,
                decoration: textInputDecoration.copyWith(
                  labelText: "Block-Room number",
                  // onChanged: ,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Place of visit :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field cant be empty!';
                  }
                  return null;
                },
                onChanged: (value) {
                  placeToVisit = value;
                },
                // obscureText: true,
                decoration: textInputDecoration.copyWith(
                  labelText: "Address",
                  // onChanged: ,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Person to whom visiting :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field cant be empty!';
                  }
                  return null;
                },
                onChanged: (value) {
                  personToVisit = value;
                },
                // obscureText: true,
                decoration: textInputDecoration.copyWith(
                  labelText: "Name",
                  // onChanged: ,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Mobile no. of the person :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (value) {
                  guardian_contact = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(\+91[\s-]?)?(\d{10})$').hasMatch(value)) {
                    return 'Enter Correct Contact';
                  } else {
                    return null;
                  }
                },
                // obscureText: true,
                decoration: textInputDecoration.copyWith(
                  labelText: "Mobile",
                  // onChanged: ,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Reason :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field cant be empty!';
                  }
                  return null;
                },
                onChanged: (value) {
                  reason = value;
                },
                // obscureText: true,
                decoration: textInputDecoration.copyWith(
                  labelText: "Valid reason",
                  // onChanged: ,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Duration :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || !RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter duration in day count!';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  duration = value;
                },
                // obscureText: true,
                decoration: textInputDecoration.copyWith(
                  labelText: "Duration in days",
                  // onChanged: ,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Departure Date :",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _departselectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: "${departureSelectedDate.toLocal()}".split(' ')[0],
                    ),
                    decoration: textInputDecoration.copyWith(
                      labelText: "Select Date",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Arrival Date :",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => _arrivalselectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: "${arrivalSelectedDate.toLocal()}".split(' ')[0],
                    ),
                    decoration: textInputDecoration.copyWith(
                      labelText: "Select Date",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                              "Are you sure you want to submit leave application?"),
                          title: Text("Submit Leave"),
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
                                DatabaseService.addLeaveData(
                                  name,
                                  mobilenum,
                                  placeToVisit,
                                  personToVisit,
                                  guardian_contact,
                                  reason,
                                  duration,
                                  from,
                                  to,
                                  room,
                                );
                                showSnackBar(context, Colors.green,
                                    "Successfully submitted leave application....");
                                nextScreenReplace(context, StudentPage());
                              },
                              icon: Icon(Icons.done),
                              color: Colors.green,
                            )
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
