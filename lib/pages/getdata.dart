// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class GetUserData extends StatelessWidget {
//   final String documentId = 'ckLX0XR0NJudPQg1eyGj';

//   // GetUserData(this.documentId);

//   GetUserData();
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('leave_data');

//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;

//           // Access all the fields in the document
//           String id = data['id'].toString();
//           String name = data['name'].toString();
//           String reason = data['reason'].toString();
//           String room = data['room'].toString();
//           String fromDate = data['from'].toString();
//           String toData = data['to'].toString();
//           String guardianContact = data['gaurdian_contact'].toString();

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("ID: $id"),
//               Text("Name: $name"),
//               Text("Reason: $reason"),
//               Text("Room: $room"),
//               Text("From: $fromDate"),
//               Text("To: $toData"),
//               Text("Guardian Contact: $guardianContact"),
//             ],
//           );
//         }

//         return Text("Loading");
//       },
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserData extends StatelessWidget {
  // Reference to the collection
  final CollectionReference users =
      FirebaseFirestore.instance.collection('leave_data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave details of all Students'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: UserSearchDelegate(users),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: users.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return Text("Collection is empty");
          }

          // Build a list of widgets from the documents in the collection
          List<Widget> userDataWidgets =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            // Access all the fields in each document
            String id = data['id'].toString();
            String name = data['name'].toString();
            String reason = data['reason'].toString();
            String room = data['room'].toString();
            String fromDate = data['from'].toString();
            String toData = data['to'].toString();
            String guardianContact = data['gaurdian_contact'].toString();

            return Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("ID: $id"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: $name"),
                        Text("Reason: $reason"),
                        Text("Room: $room"),
                        Text("From: $fromDate"),
                        Text("To: $toData"),
                        Text("Guardian Contact: $guardianContact"),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            );
          }).toList();

          return ListView(
            children: userDataWidgets,
          );
        },
      ),
    );
  }
}

class UserSearchDelegate extends SearchDelegate<String> {
  final CollectionReference users;

  UserSearchDelegate(this.users);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: users.where('name', isEqualTo: query).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Searching...");
        }

        if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
          return Text("No results found");
        }

        // Build a list of widgets from the search results
        List<Widget> searchResults =
            snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;

          // Access all the fields in each document
          String id = data['id'].toString();
          String name = data['name'].toString();
          String reason = data['reason'].toString();
          String room = data['room'].toString();
          String fromDate = data['from'].toString();
          String toData = data['to'].toString();
          String guardianContact = data['gaurdian_contact'].toString();

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("ID: $id"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: $name"),
                      Text("Reason: $reason"),
                      Text("Room: $room"),
                      Text("From: $fromDate"),
                      Text("To: $toData"),
                      Text("Guardian Contact: $guardianContact"),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          );
        }).toList();

        return ListView(
          children: searchResults,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // If there are no search results, suggest recent searches or default suggestions
    return FutureBuilder<QuerySnapshot>(
      future: users
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: query + 'z')
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Searching...");
        }

        // Build a list of suggested names
        List<String> suggestions =
            snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          return data['name'].toString();
        }).toList();

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestions[index]),
              onTap: () {
                query = suggestions[index];
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
