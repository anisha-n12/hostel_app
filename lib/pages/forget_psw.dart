import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hostel_app/pages/login_page.dart';

class forgot_pswd extends StatefulWidget {
  const forgot_pswd({super.key});

  @override
  State<forgot_pswd> createState() => _forgot_pswdState();
}

class _forgot_pswdState extends State<forgot_pswd> {
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reset your password",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 220, 212, 170),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter your Email and we will send you a reset password link",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  validator: validateEmail,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepOrangeAccent),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.grey[200]),
                )),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
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
              child: const Text("Reset Password"),
              color: Color.fromARGB(255, 241, 175, 131),
            )
          ],
        ),
      ),
    );
  }
}
