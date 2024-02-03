import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// Future<void> showAllotmentDialog(
//     BuildContext context, String studentName) async {
//   String block = '';
//   String roomNumber = '';

//   String username = '';
//   String password = '';

//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) {
//           return AlertDialog(
//             title: Text('Allotment of $studentName'),
//             content: Column(
//               children: [
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       block = value;
//                     });
//                   },
//                   decoration: InputDecoration(labelText: 'Enter Block'),
//                 ),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       roomNumber = value;
//                     });
//                   },
//                   decoration: InputDecoration(labelText: 'Enter Room Number'),
//                 ),
//                 SizedBox(height: 20),
//                 // Display generated credentials
//                 if (username.isNotEmpty && password.isNotEmpty)
//                   Text(
//                       'Generated Credentials:\nUsername: $username\nPassword: $password'),
//               ],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Cancel'),
//               ),
//               TextButton(
//                   onPressed: () {
//                     // Generate credentials
//                     // username = generateCredentials(studentName);
//                     // password = generateRandomPassword();

//                     // Update the dialog to display credentials
//                     setState(() {});

//                     // You can send credentials to warden here if needed
//                     // sendCredentialsToWarden(username, password);
//                   },
//                   child: Text(username.isEmpty
//                       ? 'Generate Credentials'
//                       : 'Credentials Sent to Warden')),
//             ],
//           );
//         },
//       );
//     },
//   );
// }
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:hostel_app/service/database_service.dart';
import 'package:hostel_app/widgets/widgets.dart';

Future<void> showAllotmentDialog(BuildContext context, String studentName,
    String email, String studentid) async {
  String block = 'Select Block';
  String roomNumber = 'Select Room';

  String username = email;
  String password = '';
  bool _agreedTo = false;

  List<String> blockOptions = [
    'Select Block',
    'Block_A',
  ]; // Replace with your block options
  List<String> availableRoomNumbers = [
    '0',
  ];
  availableRoomNumbers = await getAvailableRoomNumbersFromCollection('Block_A');
  availableRoomNumbers.insert(0, 'Select Room');
  // Replace with your room number options

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text('Allotment of $studentName'),
            content: Column(
              children: [
                DropdownButtonFormField(
                  value: block, // Ensure that block is not null
                  onChanged: (value) {
                    setState(() {
                      block = value as String;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Select Block'),
                  items: blockOptions.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                if (block.isNotEmpty) // Only show if block is selected
                  DropdownButtonFormField(
                    value: roomNumber,
                    onChanged: (value) {
                      setState(() {
                        roomNumber = value as String;
                      });
                    },
                    decoration:
                        InputDecoration(labelText: 'Select Room Number'),
                    items: availableRoomNumbers
                        .toSet()
                        .toList()
                        .map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                SizedBox(height: 20),
                // Display generated credentials
                if (username.isNotEmpty && password.isNotEmpty)
                  Text(
                    'Generated Credentials:\nUsername: $username\nPassword: $password',
                  ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _agreedTo
                      ? Color.fromARGB(255, 190, 124, 37)
                      : Colors.grey,
                ),
                onPressed: () {
                  // Generate credentials
                  // username = generateCredentials(studentName);
                  password = generateRandomPassword();

                  // Update the dialog to display credentials

                  DatabaseService.createUserLogin(
                      username, password, studentid);
                  DatabaseService.assignStudentToRoom(
                      block, roomNumber, studentid);
                  Navigator.of(context).pop();
                  showSnackBar(context, Colors.green,
                      "Student Allotted!\nCredentials are sent to Warden...");
                  setState(() {
                    _agreedTo = true;
                  });

                  // You can send credentials to warden here if needed
                  // sendCredentialsToWarden(username, password);
                },
                child: Text(
                  _agreedTo
                      ? 'Credentials Sent to Warden'
                      : 'Generate Credentials',
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

String generateRandomPassword({int length = 12}) {
  const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String digitChars = '0123456789';
  const String specialChars = '!@#\$%^&*()-=_+[]{}|;:,.<>?/';

  String allChars = lowercaseChars + uppercaseChars + digitChars + specialChars;

  Random random = Random();
  List<String> passwordList = List.generate(length, (index) {
    return allChars[random.nextInt(allChars.length)];
  });

  // Ensure that the generated password contains at least one character from each category
  passwordList[Random().nextInt(length)] =
      lowercaseChars[random.nextInt(lowercaseChars.length)];
  passwordList[Random().nextInt(length)] =
      uppercaseChars[random.nextInt(uppercaseChars.length)];
  passwordList[Random().nextInt(length)] =
      digitChars[random.nextInt(digitChars.length)];
  passwordList[Random().nextInt(length)] =
      specialChars[random.nextInt(specialChars.length)];

  return passwordList.join();
}

Future<List<String>> getAvailableRoomNumbersFromCollection(
    String collectionName) async {
  List<String> availableRoomNumbers = [];

  try {
    // Reference to the Firestore collection
    CollectionReference blockACollection =
        FirebaseFirestore.instance.collection(collectionName);

    // Loop through subcollections (1, 2, 3, 4, 5, 6)
    for (int i = 1; i <= 6; i++) {
      String subcollectionName = i.toString();

      // Reference to the subcollection document
      DocumentReference subcollectionDocRef =
          blockACollection.doc(subcollectionName);

      // Fetch the document from the subcollection
      DocumentSnapshot subcollectionDoc = await subcollectionDocRef.get();

      // Check if any of the fields in the document are empty
      if (subcollectionDoc.exists) {
        bool isAvailable = subcollectionDoc['student1'] == "" ||
            subcollectionDoc['student2'] == "" ||
            subcollectionDoc['student3'] == "";
        print('$isAvailable $subcollectionName');
        if (isAvailable) {
          availableRoomNumbers.add(
              subcollectionName); // Add the available room number to the list
        }
      }
    }
  } catch (e, stackTrace) {
    print("Error fetching data: $e");
    print("Stack trace: $stackTrace");
  }

  return availableRoomNumbers;
}
