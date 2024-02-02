// import 'package:flutter/material.dart';

// ///useless
// class RoomChangeList extends StatefulWidget {
//   const RoomChangeList({Key? key}) : super(key: key);

//   @override
//   _RoomChangeListState createState() => _RoomChangeListState();
// }

// class _RoomChangeListState extends State<RoomChangeList> {
//   static const primaryColor = Color.fromARGB(255, 249, 249, 249);
//   // static const secondaryColor = Color.fromARGB(255, 240, 216, 216);

//   // Sample list of room change requests
//   List<String> roomChangeRequests = [
//     'Request 111',
//     'Request 2',
//     'Request 3',
//     'Request 4',
//     'Request 6',
//   ];

//   // Filtered list based on search query
//   List<String> filteredRequests = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: const Text('Room Change Requests'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               showSearch(
//                   context: context,
//                   delegate: RoomChangeSearch(roomChangeRequests));
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: filteredRequests.length == 0
//             ? roomChangeRequests.length
//             : filteredRequests.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.all(8.0),
//             color: Colors.white.withOpacity(0.9), // Faint white background
//             child: ListTile(
//               title: Text(
//                 filteredRequests.length == 0
//                     ? roomChangeRequests[index]
//                     : filteredRequests[index],
//                 style: const TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 0, 0, 0),
//                 ),
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 8.0),
//                   Text(
//                     'Details for Request ${index + 1}',
//                     style: TextStyle(
//                       fontSize: 14.0,
//                       color: const Color.fromARGB(255, 71, 71, 71),
//                     ),
//                   ),
//                 ],
//               ),
//               trailing: ElevatedButton(
//                 onPressed: () {
//                   // Handle button tap
//                 },
//                 child: const Text('Show Details'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.black, // Black button background
//                   textStyle: const TextStyle(
//                     color: Colors.white, // White button text color
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class RoomChangeSearch extends SearchDelegate<String> {
//   final List<String> roomChangeRequests;

//   RoomChangeSearch(this.roomChangeRequests);

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return _buildList(roomChangeRequests
//         .where((request) => request.contains(query))
//         .toList());
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return _buildList(roomChangeRequests
//         .where((request) => request.contains(query))
//         .toList());
//   }

//   Widget _buildList(List<String> results) {
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(
//             results[index],
//             style: const TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8.0),
//               Text(
//                 'Details for Request ${roomChangeRequests.indexOf(results[index]) + 1}',
//                 style: TextStyle(fontSize: 14.0, color: Colors.grey),
//               ),
//             ],
//           ),
//           trailing: ElevatedButton(
//             onPressed: () {
//               // Handle button tap
//             },
//             child: const Text('Show Details'),
//             style: ElevatedButton.styleFrom(
//               // primary: Colors.black,
//               foregroundColor: Colors.white,
//               textStyle: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
