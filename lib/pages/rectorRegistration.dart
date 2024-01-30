import 'package:flutter/material.dart';

class RegisterRector extends StatefulWidget {
  @override
  _RegisterRectorState createState() => _RegisterRectorState();
}

class _RegisterRectorState extends State<RegisterRector> {
  // Controller for text fields
  TextEditingController fullNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController academicQualificationsController =
      TextEditingController();
  TextEditingController workExperienceController = TextEditingController();
  TextEditingController hostelNameController = TextEditingController();
  TextEditingController floorAssignmentController = TextEditingController();
  TextEditingController emergencyContactController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rector Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Personal Information
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            TextField(
              controller: contactNumberController,
              decoration: InputDecoration(labelText: 'Contact Number'),
            ),
            TextField(
              controller: emailAddressController,
              decoration: InputDecoration(labelText: 'Email Address'),
            ),

            // Address Information
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: stateController,
              decoration: InputDecoration(labelText: 'State'),
            ),
            TextField(
              controller: zipCodeController,
              decoration: InputDecoration(labelText: 'ZIP Code'),
            ),

            // Professional Information
            TextField(
              controller: designationController,
              decoration: InputDecoration(labelText: 'Designation'),
            ),
            TextField(
              controller: departmentController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            TextField(
              controller: academicQualificationsController,
              decoration: InputDecoration(labelText: 'Academic Qualifications'),
            ),
            TextField(
              controller: workExperienceController,
              decoration: InputDecoration(labelText: 'Work Experience'),
            ),

            // Emergency Contact
            TextField(
              controller: emergencyContactController,
              decoration: InputDecoration(labelText: 'Emergency Contact'),
            ),

            // User Account Credentials
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),

            // Registration Button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle registration logic here
                // You can access the entered values using the controller.text
              },
              child: Text('Register Rector'),
            ),
          ],
        ),
      ),
    );
  }
}
