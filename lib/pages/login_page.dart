import 'package:flutter/material.dart';
import 'package:hostel_app/pages/forget_psw.dart';
import 'package:hostel_app/pages/rectorpage.dart';
// import 'package:hostel_app/pages/home_page.dart';
import 'package:hostel_app/pages/reg_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hostel_app/pages/studentpage.dart';
import 'package:hostel_app/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String dropDownValue = "Select your category";
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!EmailValidator.validate(value)) {
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

  bool isLoading = false;

  final spinkit =
      const SpinKitChasingDots(color: Colors.orangeAccent, size: 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          ListView(
            children: [
              Material(
                color: const Color.fromARGB(255, 220, 212, 170),
                child: Column(
                  children: [
                    Image.asset(
                      "lib/assets/images/Welcome (3).png",
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButton<String>(
                        value: dropDownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Select your category",
                            child: Text("Select your category"),
                          ),
                          DropdownMenuItem<String>(
                            value: "Student",
                            child: Text("Student"),
                          ),
                          DropdownMenuItem<String>(
                            value: "Rector",
                            child: Text("Rector"),
                          ),
                          DropdownMenuItem<String>(
                            value: "Warden",
                            child: Text("Warden"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
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
                                prefixIcon: Icon(Icons.person),
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: "Name",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: validateEmail,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: "Email",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: validatepassword,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: "Password",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await Future.delayed(
                                  const Duration(seconds: 2),
                                  () {
                                    setState(() {
                                      isLoading = false;
                                    });

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const forgot_pswd(),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 172, 78, 24),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Center(
                              child: ElevatedButton(
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 216, 142, 45),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    // Simulate a delay (you would typically call an async operation here)
                                    Future.delayed(
                                      const Duration(seconds: 2),
                                      () {
                                        setState(() {
                                          isLoading = false;
                                        });

                                        nextScreenReplace(
                                            context, RectorPage());
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      setState(() {
                                        isLoading = false;
                                      });

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const StudentPage(),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  "Register for new user",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 173, 103, 10),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Loading spinner
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: spinkit,
              ),
            ),
        ],
      ),
    );
  }
}
