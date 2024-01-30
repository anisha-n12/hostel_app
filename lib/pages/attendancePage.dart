// ignore: file_names
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hostel_app/shared/constants.dart';

class attendancePage extends StatefulWidget {
  const attendancePage({super.key});

  @override
  State<attendancePage> createState() => _attendancePageState();
}

class _attendancePageState extends State<attendancePage> {
  // Track the state of each checkbox
  bool student1Checked = false;
  bool student2Checked = false;
  bool student3Checked = false;

  // Store the color of each button
  Color buttonColor = Constants.secondaryColor;
  // Function to check if all checkboxes are selected
  bool areAllStudentsSelected() {
    return student1Checked && student2Checked && student3Checked;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the maximum length of the button text
    final int maxTextLength =
        2; // Change this based on your actual maximum length

    // Calculate the size based on the maximum text length
    final double buttonWidth = 60.0 + 10.0 * maxTextLength;
    final double buttonHeight = 70.0;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.primaryColor,
          title: const Text(
            "Mark Attendance",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey,
                  width: 400.0,
                  height: 200.0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CheckboxListTile(
                          title: Text("Student 1"),
                          value: student1Checked,
                          onChanged: (value) {
                            setState(() {
                              student1Checked = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text("Student 2"),
                          value: student2Checked,
                          onChanged: (value) {
                            setState(() {
                              student2Checked = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text("Student 3"),
                          value: student3Checked,
                          onChanged: (value) {
                            setState(() {
                              student3Checked = value!;
                            });
                          },
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < 4; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      final buttonIndex = i * 4 + index + 1;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Change the color when button is pressed
                            setState(() {
                              buttonColor = areAllStudentsSelected()
                                  ? Colors.green
                                  : Colors.red;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            minimumSize: Size(buttonWidth, buttonHeight),
                          ),
                          child: Text("R$buttonIndex"),
                        ),
                      );
                    }),
                  ),
              ]),
        ));
  }
}
