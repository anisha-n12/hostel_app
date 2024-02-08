import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoomChangeList extends StatelessWidget {
  final CollectionReference roomChangeData =
      FirebaseFirestore.instance.collection('room_change_data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Change Application'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: RoomChangeSearchDelegate(roomChangeData),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: roomChangeData.get(),
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

          List<Widget> roomChangeDataWidgets =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            String name = data['name'].toString();
            String course = data['course'].toString();
            String desiredHostel = data['desiredHostel'].toString();
            String reason = data['reason'].toString();
            String room = data['room'].toString();
            bool isAccepted = data['isAccepted'] ?? false;

            return Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Name: $name"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course: $course"),
                        Text("Desired Hostel: $desiredHostel"),
                        Text("Reason: $reason"),
                        Text("Room: $room"),
                        Text("Status: ${isAccepted ? 'Accepted' : 'Pending'}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (!isAccepted) // Show button only for pending requests
                          ElevatedButton(
                            onPressed: () {
                              // Handle accept logic
                              _updateRoomChangeStatus(document.id, true);
                            },
                            child: Text('Accept'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                          ),
                        if (!isAccepted) // Show button only for pending requests
                          ElevatedButton(
                            onPressed: () {
                              // Handle reject logic
                              _updateRoomChangeStatus(document.id, false);
                            },
                            child: Text('Reject'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            );
          }).toList();

          return ListView(
            children: roomChangeDataWidgets,
          );
        },
      ),
    );
  }

  Future<void> _updateRoomChangeStatus(String documentId, bool isAccepted) {
    return roomChangeData.doc(documentId).update({'isAccepted': isAccepted});
  }
}

class RoomChangeSearchDelegate extends SearchDelegate<String> {
  final CollectionReference roomChangeData;

  RoomChangeSearchDelegate(this.roomChangeData);

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
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(query);
  }

  Widget _buildSearchResults(String searchQuery) {
    return FutureBuilder<QuerySnapshot>(
      future: roomChangeData
          .where('name', isGreaterThanOrEqualTo: searchQuery)
          .where('name', isLessThan: searchQuery + 'z')
          .get(),
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

        List<Widget> searchResults =
            snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;

          String name = data['name'].toString();
          String course = data['course'].toString();
          String desiredHostel = data['desiredHostel'].toString();
          String reason = data['reason'].toString();
          String room = data['room'].toString();
          bool isAccepted = data['isAccepted'] ?? false;

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Name: $name"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Course: $course"),
                      Text("Desired Hostel: $desiredHostel"),
                      Text("Reason: $reason"),
                      Text("Room: $room"),
                      Text("Status: ${isAccepted ? 'Accepted' : 'Pending'}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isAccepted) // Show buttons only for pending requests
                        IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            // Handle accept logic
                            _updateRoomChangeStatus(document.id, true);
                          },
                        ),
                      if (!isAccepted) // Show buttons only for pending requests
                        IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            // Handle reject logic
                            _updateRoomChangeStatus(document.id, false);
                          },
                        ),
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

  Future<void> _updateRoomChangeStatus(String documentId, bool isAccepted) {
    return roomChangeData.doc(documentId).update({'isAccepted': isAccepted});
  }
}
