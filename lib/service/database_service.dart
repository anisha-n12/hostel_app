import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/pages/WardenPage.dart';
import 'package:hostel_app/pages/rector.dart';
import 'package:hostel_app/pages/studentpage.dart';
import 'package:hostel_app/widgets/widgets.dart';

// class DatabaseService {
//   final String? uid;

//   DatabaseService({this.uid});

//   final CollectionReference complaintsCollection =
//       FirebaseFirestore.instance.collection("complaints");
// final CollectionReference groupCollection =
//     FirebaseFirestore.instance.collection("groups");

//saving user data
//   Future saveUserData(String fullname, String email) async {
//     return await userCollection.doc(uid).set({
//       "fullName": fullname,
//       "email": email,
//       "groups": [],
//       "proflepic": "",
//       "uid": uid
//     });
//   }
// //gettting the user data

//   Future getUserData(String email) async {
//     QuerySnapshot snapshot =
//         await userCollection.where("email", isEqualTo: email).get();
//     return snapshot;
//   }

//   //get user group
//   getUserGroups() async {
//     return userCollection.doc(uid).snapshots();
//   }

//   Future createGroup(String userName, String id, String groupName) async {
//     DocumentReference documentReference = await groupCollection.add({
//       "groupName": groupName,
//       "groupIcon": "",
//       "admin": "${id}_$userName",
//       "members": [],
//       "groupID": "",
//       "recentMessage": "",
//       "recentMessageSender": "",
//     });

//     await documentReference.update({
//       "members": FieldValue.arrayUnion(["${uid}_$userName"]),
//       "groupId": documentReference.id,
//     });
//     DocumentReference userDocumentReference = userCollection.doc(uid);
//     return await userDocumentReference.update({
//       "groups": FieldValue.arrayUnion(["${documentReference.id}_$groupName"])
//     });
//   }

//   //get chat
//   getChats(String groupId) async {
//     return groupCollection
//         .doc(groupId)
//         .collection("messages")
//         .orderBy("time")
//         .snapshots();
//   }

//   Future getGroupAdmin(String groupId) async {
//     DocumentReference d = groupCollection.doc(groupId);
//     DocumentSnapshot documentSnapshot = await d.get();
//     return documentSnapshot['admin'];
//   }

//   getGroupMembers(groupId) async {
//     return groupCollection.doc(groupId).snapshots();
//   }

//   searchByName(String groupName) {
//     return groupCollection.where("groupName", isEqualTo: groupName).get();
//   }

//   Future<bool> isUserJoined(
//       String groupName, String groupId, String userName) async {
//     DocumentReference userDocumentReference = userCollection.doc(uid);
//     DocumentSnapshot documentSnapshot = await userDocumentReference.get();
//     List<dynamic> groups = await documentSnapshot['groups'];
//     if (groups.contains("${groupId}_$groupName")) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future toggleGroupJoin(
//       String groupId, String userName, String groupName) async {
//     DocumentReference userDocumentReference = userCollection.doc(uid);
//     DocumentReference groupDocumentReference = groupCollection.doc(groupId);
//     DocumentSnapshot documentSnapshot = await userDocumentReference.get();
//     List<dynamic> groups = await documentSnapshot['groups'];

//     if (groups.contains("${groupId}_$groupName")) {
//       await userDocumentReference.update({
//         "groups": FieldValue.arrayRemove(["${groupId}_$groupName"])
//       });
//       await groupDocumentReference.update({
//         "groups": FieldValue.arrayRemove(["${uid}_$userName"])
//       });
//     } else {
//       await userDocumentReference.update({
//         "groups": FieldValue.arrayUnion(["${groupId}_$groupName"])
//       });
//       await groupDocumentReference.update({
//         "groups": FieldValue.arrayUnion(["${uid}_$userName"])
// });
//   getChats(String groupId) async {
// return complaintsCollection
//     .doc(groupId)
//     .collection("messages")
//     .orderBy("time")
//     .snapshots();
//    }
// }

class DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future<void> addStudentData(
    String name,
    String email,
    String mobile,
    String homeAddress,
    String buildingNo,
    String locality,
    String district,
    String city,
    String pinCode,
    String gender,
    String parentName,
    String parentMobile,
    String regId,
    String program,
    String branch,
    String year,
    String generalMeritNo,
    String seatType,
    String category,
    String admissionDate,
    String guardianName,
    String guardianMobile,
  ) async {
    final CollectionReference studentCollection =
        FirebaseFirestore.instance.collection("students");

    try {
      await studentCollection.add({
        "name": name,
        "email": email,
        "mobile": mobile,
        "homeAddress": homeAddress,
        "buildingNo": buildingNo,
        "locality": locality,
        "district": district,
        "city": city,
        "pinCode": pinCode,
        "gender": gender,
        "parentName": parentName,
        "parentMobile": parentMobile,
        "regId": regId,
        "program": program,
        "branch": branch,
        "year": year,
        "generalMeritNo": generalMeritNo,
        "seatType": seatType,
        "category": category,
        "admissionDate": admissionDate,
        "guardianName": guardianName,
        "generalmeritnum": generalMeritNo,
        "guardianMobile": guardianMobile,
        "allotted": "No",
        "loginID": "",
        "password": "",
      });
      print("Student data added successfully");
    } catch (e) {
      print("Error adding student data: $e");
      // Handle the error as needed
    }
  }

  static Future<void> addLeaveData(
    String name,
    String mobilenum,
    String placeToVisit,
    String personToVisit,
    String guardian_contact,
    String reason,
    String duration,
    String from,
    String to,
    String room,
  ) async {
    final CollectionReference leaveDataCollection =
        FirebaseFirestore.instance.collection("leave_data");

    try {
      await leaveDataCollection.add({
        "name": name,
        "mobilenum": mobilenum,
        "placeToVisit": placeToVisit,
        "personToVisit": personToVisit,
        "guardian_contact": guardian_contact,
        "reason": reason,
        "duration": duration,
        "from": from,
        "to": to,
        "room": room,
      });
      print("Leave data added successfully");
    } catch (e) {
      print("Error adding leave data: $e");
      // Handle the error as needed
    }
  }

  //Adding Rooma Change data
  static Future<void> addRoomChangeData(
      String name,
      String desiredHostel,
      String course,
      String reason,
      String room,
      bool isAccepeted,
      bool done) async {
    final CollectionReference roomChangeDataCollection =
        FirebaseFirestore.instance.collection("room_change_data");

    try {
      await roomChangeDataCollection.add({
        "name": name,
        "desiredHostel": desiredHostel,
        "course": course,
        "reason": reason,
        "room": room,
        "isAccepted": false,
        "done": false
      });
      print("Room Change Application data added successfully");
    } catch (e) {
      print("Error adding data: $e");
      // Handle the error as needed
    }
  }
  ////=================================

  static Future<void> addInOutData(
    String name,
    String studentContact,
    String roomNumber,
    String location,
    String reason,
    String parentContact,
  ) async {
    final CollectionReference inOutDataCollection =
        FirebaseFirestore.instance.collection("in_out_data");

    try {
      await inOutDataCollection.add({
        "name": name,
        "studentContact": studentContact,
        "roomNumber": roomNumber,
        "location": location,
        "reason": reason,
        "parentContact": parentContact,
        "inTime": "",
        "outTime": ""
      });
      print("In/Out data added successfully");
    } catch (e) {
      print("Error adding In/Out data: $e");
      // Handle the error as needed
    }
  }

  static Future<void> addWardenData(
    String RecOrWar,
    String fullName,
    String gender,
    String age,
    String contactNumber,
    String email,
    String city,
    String state,
    String education,
    String workExperience,
    String department,
    String designation,
    String emergencyContactNumber,
    String username,
    String password,
  ) async {
    final CollectionReference wardenDataCollection =
        FirebaseFirestore.instance.collection("warden_data");
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      await wardenDataCollection.add({
        "Rector/Warden": RecOrWar,
        "fullName": fullName,
        "gender": gender,
        "age": age,
        "contactNumber": contactNumber,
        "email": email,
        "city": city,
        "state": state,
        "education": education,
        "workExperience": workExperience,
        "designation": designation,
        "department": department,
        "emergencyContactNumber": emergencyContactNumber,
        "username": username,
        "password": password,
      });
      print("Warden data added successfully");
      // Example code to create a user and store additional information in Firestore
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: username,
          password: password,
        );

        // Store user role in Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': userCredential.user!.email,
          'role': RecOrWar, // or 'home' based on your categories
        });
      } catch (e) {
        print("Error creating user: $e");
      }
    } catch (e) {
      print("Error adding Warden data: $e");
      // Handle the error as needed
    }
  }

  static Future creatUserStudent(String username, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );

      // Store user role in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'role': "Student", // or 'home' based on your categories
      });
    } catch (e) {
      print("Error creating user: $e");
    }
  }

  static Future<void> createUserLogin(String username, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );

      // Store user role in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'role': "Student", // or 'home' based on your categories
      });
    } catch (e) {
      print("Error creating user: $e");
    }
  }

  static Future<void> signInUser(
      BuildContext context, String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _redirectUser(context, userCredential.user!);
      showSnackBar(context, Colors.green, "Logged in successfully...");
    } on FirebaseAuthException catch (e) {
      print("Error signing in: $e");
      // if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      showSnackBar(context, Colors.red, "Incorrect email or password...");
      // }
    }
  }

  static void _redirectUser(BuildContext context, User user) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(user.uid).get();
    String role = userDoc['role'];

    if (role == 'Rector') {
      nextScreenReplace(context, RectorPage());
    } else if (role == 'Warden') {
      nextScreenReplace(context, WardenPage());
    } else if (role == 'Student') {
      nextScreenReplace(context, StudentPage());
    }
  }
}
