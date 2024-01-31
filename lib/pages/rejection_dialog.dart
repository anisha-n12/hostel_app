import 'package:flutter/material.dart';

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
              decoration: InputDecoration(labelText: 'Enter Rejection Reason'),
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
              print('Student $studentName rejected. Reason: $rejectionReason');
              Navigator.of(context).pop();
            },
            child: Text('Reject'),
          ),
        ],
      );
    },
  );
}
