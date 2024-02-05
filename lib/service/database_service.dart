import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/pages/WardenPage.dart';
import 'package:hostel_app/pages/adminpage.dart';
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
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
        "block": "",
        "room": "",
        "allotmentdate": ""
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

  static Future createUserLogin(
      String username, String password, String studentid) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );

      // Store user role in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': username,
        'role': "Student", // or 'home' based on your categories
      });
      DocumentReference studentRef =
          FirebaseFirestore.instance.collection('students').doc(studentid);

      // Update the login and password fields
      await studentRef.update({
        'login': username,
        'password': password,
      });
    } catch (e) {
      print("Error creating user: $e");
    }
  }

  static Future<void> signInUser(
      BuildContext context, String email, String password, String role) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _redirectUser(context, userCredential.user!, role);
      showSnackBar(context, Colors.green, "Logged in successfully...");
    } on FirebaseAuthException catch (e) {
      print("Error signing in: $e");
      // if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      showSnackBar(context, Colors.red, "Incorrect email or password...");
      // }
    }
  }

  static void _redirectUser(
      BuildContext context, User user, String role) async {
    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(user.uid).get();
    String roleinData = userDoc['role'];

    if (roleinData == 'Rector' && role == "Rector") {
      nextScreenReplace(context, RectorPage());
    } else if (roleinData == 'Warden' && role == "Warden") {
      nextScreenReplace(context, WardenPage());
    } else if (roleinData == 'Student' && role == "Student") {
      nextScreenReplace(context, StudentPage());
    } else if (roleinData == 'Admin' && role == "Admin") {
      nextScreenReplace(context, AdminPage());
    } else {
      showSnackBar(context, Colors.red, "No user found with given role!");
    }
  }

  static Future<void> assignStudentToRoom(
      String blockNo, String roomNo, String studentId) async {
    try {
      // Reference to the specific room document
      DocumentReference roomRef =
          FirebaseFirestore.instance.collection(blockNo).doc(roomNo);

      // Get the current room data
      DocumentSnapshot roomSnapshot = await roomRef.get();

      // Check if the room document exists
      if (roomSnapshot.exists) {
        Map<String, dynamic> roomData =
            roomSnapshot.data() as Map<String, dynamic>;

        // Check and update the first available student field
        if (roomData['student1'] == '') {
          await roomRef.update({'student1': studentId});
        } else if (roomData['student2'] == '') {
          await roomRef.update({'student2': studentId});
        } else if (roomData['student3'] == '') {
          await roomRef.update({'student3': studentId});
        } else {
          print('Room is already full. Cannot assign more students.');
          return;
        }

        print(
            'Student $studentId assigned to Block $blockNo, Room $roomNo successfully.');
      } else {
        print('Room $roomNo in Block $blockNo not found.');
      }
    } catch (e) {
      print('Error assigning student to room: $e');
    }
    try {
      // Reference to the student document in Firestore
      DocumentReference studentRef =
          FirebaseFirestore.instance.collection('students').doc(studentId);

      // Update the fields
      await studentRef.update({
        'allotted': "Yes",
        'block': blockNo,
        'room': roomNo,
        'allotmentdate': '${DateTime.now().toLocal()}'.split(' ')[0],
      });

      print('Student details updated successfully!');
    } catch (e) {
      print('Error updating student details: $e');
    }
  }

  static Future<void> resetPasswordForCurrentUser(String newPassword) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Update the password for the current user
        await currentUser.updatePassword(newPassword);

        print('Password reset successfully.');
      } else {
        print('No user is signed in.');
      }
    } catch (e) {
      print('Error resetting password: $e');
    }
  }

  static Future<Map<String, dynamic>?> getCurrentUserData() async {
    try {
      User? user = _auth.currentUser;

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('students')
          .where('email', isEqualTo: user!.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Retrieve the first document (assuming email is unique)
        DocumentSnapshot<Map<String, dynamic>> userData =
            querySnapshot.docs.first;

        // User data found in Firestore
        return userData.data();
      } else {
        // No user is signed in
        return null;
      }
    } catch (e) {
      print('Error getting current user data: $e');
      return null;
    }
  }
}
