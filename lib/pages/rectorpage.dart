// import 'package:flutter/material.dart';
// import 'package:hostel_app/pages/complaintpage.dart';
// import 'package:hostel_app/pages/homepage.dart';
// import 'package:hostel_app/pages/in_out_details.dart';
// import 'package:hostel_app/pages/leave_application_list.dart';
// import 'package:hostel_app/pages/roomchange_application_list.dart';
// import 'package:hostel_app/shared/constants.dart';
// import 'package:hostel_app/widgets/widgets.dart';

// class RectorPage extends StatefulWidget {
//   const RectorPage({super.key});

//   @override
//   State<RectorPage> createState() => _RectorPageState();
// }

// class _RectorPageState extends State<RectorPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Constants.primaryColor,
//           title: const Text(
//             "Welcome Rector--1",
//             style: TextStyle(
//               fontSize: 27,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         drawer: Drawer(
//           backgroundColor: Constants.secondaryColor,
//           child: ListView(
//             padding: const EdgeInsets.symmetric(vertical: 50),
//             children: <Widget>[
//               Icon(
//                 Icons.account_circle,
//                 size: 150,
//                 color: Colors.white,
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 "Username",
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 20),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               const Divider(
//                 height: 2,
//               ),
//               ListTile(
//                 onTap: () {},
//                 selectedColor: Constants.primaryColor,
//                 selected: true,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 leading: const Icon(
//                   Icons.account_circle,
//                   color: Colors.white,
//                 ),
//                 title: const Text("View Profile",
//                     style: TextStyle(color: Colors.white)),
//               ),
//               ListTile(
//                 onTap: () {},
//                 selectedColor: Constants.primaryColor,
//                 selected: false,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 leading: const Icon(
//                   Icons.article_outlined,
//                   color: Colors.white,
//                 ),
//                 title: const Text("Guest record",
//                     style: TextStyle(color: Colors.white)),
//               ),
//               ListTile(
//                 onTap: () {},
//                 selectedColor: Constants.primaryColor,
//                 selected: false,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 leading: const Icon(
//                   Icons.article_outlined,
//                   color: Colors.white,
//                 ),
//                 title: const Text("Allotments",
//                     style: TextStyle(color: Colors.white)),
//               ),
//               ListTile(
//                 onTap: () {
//                   nextScreen(context, ComplaintBox());
//                 },
//                 selectedColor: Constants.primaryColor,
//                 selected: false,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 leading: const Icon(
//                   Icons.chat_bubble,
//                   color: Colors.white,
//                 ),
//                 title: const Text("Complaint Box",
//                     style: TextStyle(color: Colors.white)),
//               ),
//               ListTile(
//                 onTap: () {
//                   nextScreen(context, RoomChangeList());
//                 },
//                 selectedColor: Constants.primaryColor,
//                 selected: false,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 leading: const Icon(
//                   Icons.article_outlined,
//                   color: Colors.white,
//                 ),
//                 title: const Text("Room Change Applications",
//                     style: TextStyle(color: Colors.white)),
//               ),
//               ListTile(
//                 onTap: () {
//                   nextScreen(context, InOutDetailsList());
//                 },
//                 selectedColor: Constants.primaryColor,
//                 selected: false,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 leading: const Icon(
//                   Icons.article_outlined,
//                   color: Colors.white,
//                 ),
//                 title: const Text("In out Entries",
//                     style: TextStyle(color: Colors.white)),
//               ),
//               ListTile(
//                 onTap: () {
//                   nextScreen(context, LeaveList());
//                 },
//                 selectedColor: Constants.primaryColor,
//                 selected: false,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 leading: const Icon(
//                   Icons.article_outlined,
//                   color: Colors.white,
//                 ),
//                 title: const Text("Leave Application",
//                     style: TextStyle(color: Colors.white)),
//               ),
//               ListTile(
//                 tileColor: Colors.red,
//                 onTap: () async {
//                   showDialog(
//                       barrierDismissible: false,
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           content: Text("Are you sure you want to Logout?"),
//                           title: Text("Log Out"),
//                           actions: [
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               icon: Icon(
//                                 Icons.cancel,
//                               ),
//                               color: Colors.red,
//                             ),
//                             IconButton(
//                               onPressed: () async {
//                                 nextScreenReplace(context, HomePage());
//                                 // await authService.signOut();
//                                 // Navigator.of(context).pushAndRemoveUntil(
//                                 //     MaterialPageRoute(
//                                 //         builder: (context) =>
//                                 //             const LoginPage()),
//                                 //     (route) => false);
//                               },
//                               icon: Icon(Icons.done),
//                               color: Colors.green,
//                             )
//                           ],
//                         );
//                       });
//                 },
//                 selectedColor: Constants.primaryColor,
//                 selected: false,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 leading: const Icon(
//                   Icons.exit_to_app,
//                   color: Colors.white,
//                 ),
//                 title: const Text("Log out",
//                     style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     const SizedBox(
//                       width: 320,
//                     ),
//                   ],
//                 ),
//               ]),
//         ));
//   }
// }
