import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WardenRegistration(),
    );
  }
}

class WardenRegistration extends StatefulWidget {
  @override
  _WardenRegistrationState createState() => _WardenRegistrationState();
}

class _WardenRegistrationState extends State<WardenRegistration> {
  // Controller for text fields
  TextEditingController fullNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController workExperienceController = TextEditingController();
  TextEditingController emergencyContactNameController =
      TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warden Registration'),
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
              decoration: InputDecoration(labelText: 'Age'),
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

            // Work Experience
            TextField(
              controller: workExperienceController,
              decoration: InputDecoration(labelText: 'Education'),
            ),
            TextField(
              controller: workExperienceController,
              decoration: InputDecoration(labelText: 'Work Experience'),
            ),

            // Emergency Contact
            TextField(
              controller: emergencyContactNameController,
              decoration: InputDecoration(labelText: 'Emergency Contact Name'),
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
              controller: passwordController,
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
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
