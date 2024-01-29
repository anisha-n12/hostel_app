import 'package:cloud_firestore/cloud_firestore.dart';

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
    String address,
    String gender,
    String parentName,
    String parentMobile,
    String regId,
    String program,
    String branch,
    String year,
    String category,
    DateTime admissionDate,
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
        "address": address,
        "gender": gender,
        "parentName": parentName,
        "parentMobile": parentMobile,
        "regId": regId,
        "program": program,
        "branch": branch,
        "year": year,
        "category": category,
        "admissionDate": admissionDate,
        "guardianName": guardianName,
        "guardianMobile": guardianMobile,
        "allotted": "No",
        "loginID": "",
        "password": ""
      });
      print("Student data added successfully");
    } catch (e) {
      print("Error adding student data: $e");
      // Handle the error as needed
    }
  }
}
