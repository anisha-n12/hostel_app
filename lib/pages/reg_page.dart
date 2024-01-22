import 'package:flutter/material.dart';
import 'package:hostel_app/pages/login_page.dart';
import 'package:email_validator/email_validator.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({super.key});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  String dropDownValue = "Select your Hostel/block";
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (EmailValidator.validate(value)) {
      return 'Please enter valid email ';
    }
    return null;
  }

  String? validatepassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an password';
    }
    if (value.length < 6) {
      return 'Password must be 8 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register Here",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 220, 212, 170),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Create your account ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(height: 15),

                  const Icon(
                    Icons.person_rounded,
                    color: Color.fromARGB(255, 199, 152, 23),
                    size: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //register info
                  //name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              return 'Enter Correct Name';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter your Name",
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 253, 208),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: validateEmail,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter Email",
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 253, 208),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^\d{9}$').hasMatch(value)) {
                              return 'Registration ID is of 9 digits';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Registered ID",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter Registration ID",
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 253, 208),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: validatepassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter Password",
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 253, 208),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Confirm Password ",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Password",
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 253, 208),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 363,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 253, 208),
                      border: Border.all(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropDownValue,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue = newValue!;
                              });
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: "Select your Hostel/block",
                                child: Text("Select your Hostel/Block"),
                              ),
                              DropdownMenuItem<String>(
                                value: "A",
                                child: Text("A"),
                              ),
                              DropdownMenuItem<String>(
                                value: "B",
                                child: Text("B"),
                              ),
                              DropdownMenuItem<String>(
                                value: "C",
                                child: Text("C"),
                              ),
                              DropdownMenuItem<String>(
                                value: "D",
                                child: Text("D"),
                              ),
                              DropdownMenuItem<String>(
                                value: "E",
                                child: Text("E"),
                              ),
                            ],
                          ),
                        ),
                        // Add a spacer
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Address",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter Address",
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 253, 208),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^(\+91[\s-]?)?(\d{10})$')
                                    .hasMatch(value)) {
                              return 'Enter Correct Contact';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Contact",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Contact",
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 253, 208),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 19),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Validation successful, navigate to home page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      } else {
                        return null;
                      }
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 190, 124, 37)),
                  ),
                  // Container(
                  //   decoration: const BoxDecoration(color: Colors.deepOrangeAccent),
                  //   child: const Center(
                  //     child: Text("Sign In"),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
