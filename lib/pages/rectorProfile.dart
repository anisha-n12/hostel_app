// Import necessary packages
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RectorProfile extends StatelessWidget {
  String username = 'Rector1';

  RectorProfile({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile$username'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('warden_data')
            .where('username', isEqualTo: username)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Profile not found'));
          }

          // Retrieve profile data
          List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
          if (documents.isEmpty) {
            return Center(child: Text('Document not found'));
          }

          Map<String, dynamic> data =
              documents.first.data() as Map<String, dynamic>;

          // Display profile data
          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              buildProfileItem('Full Name', data['fullName']),
              buildProfileItem('Username', data['username']),
              buildProfileItem('Email', data['email']),
              buildProfileItem('Contact Number', data['contactNumber']),
              buildProfileItem(
                  'Emergency Contact Number', data['emergencyContactNumber']),
              buildProfileItem('City', data['city']),
              buildProfileItem('State', data['state']),
              buildProfileItem('Age', data['age']),
              buildProfileItem('Gender', data['gender']),
              buildProfileItem('Department', data['department']),
              buildProfileItem('Designation', data['designation']),
              buildProfileItem('Education', data['education']),
              buildProfileItem('Work Experience', data['workExperience']),
            ],
          );
        },
      ),
    );
  }

  Widget buildProfileItem(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value ?? 'N/A'),
          Divider(),
        ],
      ),
    );
  }
}
