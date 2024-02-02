import 'package:flutter/material.dart';
import 'dart:math';

Future<void> showAllotmentDialog(
    BuildContext context, String studentName, String email) async {
  String block = '';
  String roomNumber = '';

  String username = '';
  String password = '';

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text('Allotment of $studentName'),
            content: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      block = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Enter Block'),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      roomNumber = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Enter Room Number'),
                ),
                SizedBox(height: 20),
                // Display generated credentials
                if (email.isNotEmpty && password.isNotEmpty)
                  Text(
                      'Generated Credentials:\nUsername: $email\nPassword: $password'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    // Generate credentials
                    // username = generateCredentials(studentName);
                    password = generateRandomPassword();

                    // Update the dialog to display credentials
                    setState(() {});

                    // You can send credentials to warden here if needed
                    // sendCredentialsToWarden(username, password);
                  },
                  child: Text(password.isEmpty
                      ? 'Generate Credentials'
                      : 'Credentials Sent to Warden')),
            ],
          );
        },
      );
    },
  );
}

String generateCredentials(String studentName) {
  // Remove any spaces and convert to lowercase
  String cleanedName = studentName.replaceAll(' ', '').toLowerCase();

  // If the cleaned name is less than 7 characters, pad it with '0'
  if (cleanedName.length < 7) {
    cleanedName = cleanedName.padRight(7, '0');
  }

  // Take the first 7 characters
  String username = cleanedName.substring(0, 7);

  // Add a random 2-digit number
  username += Random().nextInt(90).toString().padLeft(2, '0');

  return username;
}

String generateRandomPassword() {
  const String allowedCharacters =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+";

  String password = '';
  final Random random = Random();

  for (int i = 0; i < 9; i++) {
    password += allowedCharacters[random.nextInt(allowedCharacters.length)];
  }

  return password;
}
