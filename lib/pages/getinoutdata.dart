import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetInOutData extends StatelessWidget {
  final CollectionReference inOutData =
      FirebaseFirestore.instance.collection('in_out_data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In/Out Data of Students'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: InOutDataSearchDelegate(inOutData),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: inOutData.get(),
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

          List<Widget> inOutDataWidgets =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            String name = data['name'].toString();
            String date = data['date'].toString();
            String inTime = data['inTime'].toString();
            String outTime = data['outTime'].toString();
            String roomNumber = data['roomNumber'].toString();
            String parentPhoneNumber = data['parentPhoneNumber'].toString();
            String reason = data['reason'].toString();
            String studentPhoneNumber = data['studentPhoneNumber'].toString();

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
                        Text("Date: $date"),
                        Text("In Time: $inTime"),
                        Text("Out Time: $outTime"),
                        Text("Room Number: $roomNumber"),
                        Text("Parent Phone Number: $parentPhoneNumber"),
                        Text("Reason: $reason"),
                        Text("Student Phone Number: $studentPhoneNumber"),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            );
          }).toList();

          return ListView(
            children: inOutDataWidgets,
          );
        },
      ),
    );
  }
}

class InOutDataSearchDelegate extends SearchDelegate<String> {
  final CollectionReference inOutData;

  InOutDataSearchDelegate(this.inOutData);

  // ... (Similar modifications as before for buildActions, buildLeading, and buildResults methods)
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
  Widget buildResults(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: inOutData.where('name', isEqualTo: query).get(),
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
          String date = data['date'].toString();
          String inTime = data['inTime'].toString();
          String outTime = data['outTime'].toString();
          String roomNumber = data['roomNumber'].toString();
          String parentPhoneNumber = data['parentPhoneNumber'].toString();
          String reason = data['reason'].toString();
          String studentPhoneNumber = data['studentPhoneNumber'].toString();

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
                      Text("Date: $date"),
                      Text("In Time: $inTime"),
                      Text("Out Time: $outTime"),
                      Text("Room Number: $roomNumber"),
                      Text("Parent Phone Number: $parentPhoneNumber"),
                      Text("Reason: $reason"),
                      Text("Student Phone Number: $studentPhoneNumber"),
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
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: inOutData
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
