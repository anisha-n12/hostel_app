import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/shared/constants.dart';

class ComplaintWarden extends StatefulWidget {
  const ComplaintWarden({Key? key}) : super(key: key);

  @override
  _ComplaintWardenState createState() => _ComplaintWardenState();
}

class _ComplaintWardenState extends State<ComplaintWarden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        title: const Text(
          "Complaint Box",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ComplaintList(),
    );
  }
}

class ComplaintList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('complains').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading data'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No complaints available.'),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            String message = data['message'] ?? '';

            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(message),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
