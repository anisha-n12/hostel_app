import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/pages/allotment_dialog.dart';
import 'package:hostel_app/pages/rejection_dialog.dart'; // Import the rejection dialog

class AllotStudentList extends StatelessWidget {
  final CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: StudentSearchDelegate(students),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: students.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          List<Widget> studentDataWidgets =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            // Access all the fields in each document
            String regId = data['regId'].toString();
            String name = data['name'].toString();
            String email = data['email'].toString();
            String mobile = data['mobile'].toString();
            String branch = data['branch'].toString();
            Timestamp admissionDate1 = data['admissionDate'] as Timestamp;
            DateTime admissionDate = admissionDate1.toDate();

            String year = data['year'].toString();
            String category = data['category'].toString();
            String gender = data['gender'].toString();
            String parentName = data['parentName'].toString();
            String parentMobile = data['parentMobile'].toString();
            String guardianName = data['guardianName'].toString();
            String guardianMobile = data['guardianMobile'].toString();
            String address = data['address'].toString();
            String allotted = data['allotted'].toString();

            return Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Registration ID: $regId"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: $name"),
                        Text("Email: $email"),
                        Text("Mobile: $mobile"),
                        Text("Branch: $branch"),
                        Text("Admission Date: $admissionDate"),
                        Text("Year: $year"),
                        Text("Category: $category"),
                        Text("Gender: $gender"),
                        Text("Parent Name: $parentName"),
                        Text("Parent Mobile: $parentMobile"),
                        Text("Guardian Name: $guardianName"),
                        Text("Guardian Mobile: $guardianMobile"),
                        Text("Address: $address"),
                        // Text("Allotted: $allotted"),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle the Allot button click
                          // Add your logic here
                          showAllotmentDialog(context, name, email);
                        },
                        child: Text("Allot"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the Reject button click
                          // Add your logic here
                          showRejectionDialog(context, name);
                        },
                        child: Text("Reject"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList();

          return ListView(
            children: studentDataWidgets,
          );
        },
      ),
    );
  }
}

class StudentSearchDelegate extends SearchDelegate<String> {
  final CollectionReference students;

  StudentSearchDelegate(this.students);

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
      future: students.where('name', isEqualTo: query).get(),
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
          String regId = data['regId'].toString();
          String name = data['name'].toString();
          String email = data['email'].toString();
          String mobile = data['mobile'].toString();
          String branch = data['branch'].toString();
          Timestamp admissionDate1 = data['admissionDate'] as Timestamp;
          DateTime admissionDate = admissionDate1.toDate();

          String year = data['year'].toString();
          String category = data['category'].toString();
          String gender = data['gender'].toString();
          String parentName = data['parentName'].toString();
          String parentMobile = data['parentMobile'].toString();
          String guardianName = data['guardianName'].toString();
          String guardianMobile = data['guardianMobile'].toString();
          String address = data['address'].toString();
          String allotted = data['allotted'].toString();

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Registration ID: $regId"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: $name"),
                      Text("Email: $email"),
                      Text("Mobile: $mobile"),
                      Text("Branch: $branch"),
                      Text("Admission Date: $admissionDate"),
                      Text("Year: $year"),
                      Text("Category: $category"),
                      Text("Gender: $gender"),
                      Text("Parent Name: $parentName"),
                      Text("Parent Mobile: $parentMobile"),
                      Text("Guardian Name: $guardianName"),
                      Text("Guardian Mobile: $guardianMobile"),
                      Text("Address: $address"),
                      Text("Allotted: $allotted"),
                    ],
                  ),
                ),
                Divider(),
                ElevatedButton(
                  onPressed: () {
                    // Handle the Allot button click
                    // Add your logic here

                    showAllotmentDialog(context, name, email);
                  },
                  child: Text("Allot"),
                ),
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
      future: students
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

  void showRejectionDialog(BuildContext context, String studentName) {
    String rejectionReason = '';

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rejection for $studentName'),
          content: Column(
            children: [
              TextField(
                onChanged: (value) {
                  rejectionReason = value;
                },
                decoration:
                    InputDecoration(labelText: 'Enter Rejection Reason'),
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
            TextButton(
              onPressed: () {
                // Handle the rejection logic here
                print(
                    'Student $studentName rejected. Reason: $rejectionReason');
                Navigator.of(context).pop();
              },
              child: Text('Reject'),
            ),
          ],
        );
      },
    );
  }
}
