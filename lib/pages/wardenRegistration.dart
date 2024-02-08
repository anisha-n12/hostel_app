import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/pages/adminpage.dart';
import 'package:hostel_app/service/database_service.dart';
import 'package:hostel_app/widgets/widgets.dart';

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
  String fullName = "";
  String gender = "";
  String age = "";
  String education = "";
  String workExperience = "";
  String contactNumber = "";
  String emailAddress = "";
  String city = "";
  String state = "";
  String emergencyContactNumber = "";
  String username = "";
  String password = "";
  String confirmPassword = "";

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter valid email ';
    }
    return null;
  }

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
            // Full Name
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Full Name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Full Name",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Gender
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Gender';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      gender = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Gender",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Gender",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Age
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Age';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      age = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Age",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Age",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Contact Number
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Contact Number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      contactNumber = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Contact Number",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Contact Number",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),
            // Email Address
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email Address';
                      }
                      // You can add additional validation for email format if needed
                      return null;
                    },
                    onChanged: (value) {
                      emailAddress = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Email Address",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Email Address",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // City
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your City';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      city = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "City",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter City",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your State';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      state = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "State",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter State",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Education
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Education';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      education = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Education",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Education",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Work Experience
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Work Experience';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      workExperience = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Work Experience",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Work Experience",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),
// Emergency Contact Number
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Emergency Contact Number';
                      }
                      // You can add additional validation for contact number format if needed
                      return null;
                    },
                    onChanged: (value) {
                      emergencyContactNumber = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Emergency Contact Number",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Emergency Contact Number",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Username
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: validateEmail,
                    onChanged: (value) {
                      username = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "User Email",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Email for sign up",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Password
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }
                      // You can add additional validation for password format if needed
                      return null;
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Password",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Confirm Password
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your Password';
                      } else if (value != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    obscureText: true,
                    onChanged: (value) {
                      confirmPassword = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Re-enter Password",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ],
              ),
            ),

            // Registration Button
            SizedBox(height: 20),
            const SizedBox(height: 19),
            ElevatedButton(
              onPressed: () {
                // Validation successful, navigate to home page
                DatabaseService.addWardenData(
                    "Warden",
                    fullName,
                    gender,
                    age,
                    contactNumber,
                    emailAddress,
                    city,
                    state,
                    education,
                    workExperience,
                    "",
                    "",
                    emergencyContactNumber,
                    username,
                    password);
                showSnackBar(context, Colors.green,
                    "Warden registered successfully!\nTry Logging in...");
                nextScreen(context, AdminPage());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 190, 124, 37)),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
