import 'package:flutter/material.dart';
import 'package:hostel_app/pages/studentpage.dart';
import 'package:hostel_app/shared/constants.dart';
import 'package:hostel_app/widgets/widgets.dart';

class LeaveApp extends StatefulWidget {
  LeaveApp({Key? key}) : super(key: key);

  @override
  State<LeaveApp> createState() => _LeaveAppState();
}

class _LeaveAppState extends State<LeaveApp> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
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
                decoration: textInputDecoration.copyWith(
                  labelText: "Mobile",
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
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: "${selectedDate.toLocal()}".split(' ')[0],
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
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: "${selectedDate.toLocal()}".split(' ')[0],
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
                                showSnackBar(context, Colors.green,
                                    "Successfully submitted leave....");
                                nextScreenReplace(context, StudentPage());
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
