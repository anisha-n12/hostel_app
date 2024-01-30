import 'package:flutter/material.dart';
import 'package:hostel_app/pages/homepage.dart';
import 'package:hostel_app/pages/login_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hostel_app/service/database_service.dart';
import 'package:hostel_app/widgets/widgets.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({super.key});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  String programDropDown = "Select your Program";
  String categoryDropDown = "Select your category";
  String yearDropDown = "Select your year";
  String genderselected = "Select your gender";
  String seatTypeDropDown= "Select Seat Type";
  bool _agreedTo = false;
  final _formKey = GlobalKey<FormState>();
  DateTime admissionSelectedDate = DateTime.now();
  String name = "";
  String email = "";
  String mobile = "";
  String city = "";
  String district = "";
  String buildingNo = "";
  String homeAddress = "";
  String pinCode = "";
  String locality = "";
  String gender = "";
  String generalMeritNo="";
  String parentName = "";
  String seatType="";
  String parentMobile = "";
  String regId = "";
  String program = "";
  String branch = "";
  String year = "";
  String category = "";
  DateTime admissionDate = DateTime.now();
  String guardianName = "";
  String guardianMobile = "";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: admissionSelectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != admissionSelectedDate) {
      setState(() {
        admissionSelectedDate = picked;
      });
      admissionDate = admissionSelectedDate;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    // if (EmailValidator.validate(value)) {
    //   return 'Please enter valid email ';
    // }
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                          onChanged: (value) {
                            name = value;
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
                          onChanged: (value) {
                            email = value;
                          },
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
                          // validator: (value) {
                          //   if (value!.isEmpty ||
                          //       !RegExp(r'^\d{9}$').hasMatch(value)) {
                          //     return 'Registration ID is of 9 digits';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onChanged: (value) {
                            mobile = value;
                          },
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
                            labelText: "Mobile",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Mobile no.",
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
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your home address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      homeAddress = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Home Address",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Home Address",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the building/block number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      buildingNo = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Building/Block No.",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Building/Block No.",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the locality';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      locality = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Locality",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Locality",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the district';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      district = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "District",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter District",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the city';
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
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the pin code';
                      } else if (value.length != 6) {
                        return 'Pin code must have exactly 6 digits';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      pinCode = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Pin Code",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter Pin Code",
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 253, 208),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
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
                            value: genderselected,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? newValue) {
                              setState(() {
                                genderselected = newValue!;
                              });
                              gender = newValue!;
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: "Select your gender",
                                child: Text("Select your gender"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Male",
                                child: Text("Male"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Female",
                                child: Text("Female"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Other",
                                child: Text("Otehr"),
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
                          onChanged: (value) {
                            parentName = value;
                          },
                          decoration: const InputDecoration(
                            labelText: "Parent's Name",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Parent's Full name (Father/Mother)",
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
                          onChanged: (value) {
                            parentMobile = value;
                          },
                          decoration: const InputDecoration(
                            labelText: "Parent's Contact",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Parent's Contact",
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
                              return 'Registration ID must be of 9 digits';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            regId = value;
                          },
                          decoration: const InputDecoration(
                            labelText: "Registration ID",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Registration ID",
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
                            value: programDropDown,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? newValue) {
                              setState(() {
                                programDropDown = newValue!;
                              });
                              program = newValue!;
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: "Select your Program",
                                child: Text("Select your Program"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Diploma",
                                child: Text("Diploma"),
                              ),
                              DropdownMenuItem<String>(
                                value: "B. Tech",
                                child: Text("B. Tech"),
                              ),
                              DropdownMenuItem<String>(
                                value: "M. Tech",
                                child: Text("M. Tech"),
                              ),
                              DropdownMenuItem<String>(
                                value: "MCA",
                                child: Text("MCA"),
                              ),
                              DropdownMenuItem<String>(
                                value: "P.hd",
                                child: Text("P.hd"),
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
                          onChanged: (value) {
                            branch = value;
                          },
                          decoration: const InputDecoration(
                            labelText: "Branch",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter Branch",
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
                            value: yearDropDown,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? newValue) {
                              setState(() {
                                yearDropDown = newValue!;
                              });
                              year = newValue!;
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: "Select your year",
                                child: Text("Select your year"),
                              ),
                              DropdownMenuItem<String>(
                                value: "First",
                                child: Text("First"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Second",
                                child: Text("Second"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Third",
                                child: Text("Third"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Final",
                                child: Text("Final"),
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
Container(
  width: 363,
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
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
          value: seatTypeDropDown,
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          style: const TextStyle(color: Colors.black),
          onChanged: (String? newValue) {
            setState(() {
              seatTypeDropDown = newValue!;
            });
            seatType = newValue!;
          },
          items: const [
            DropdownMenuItem<String>(
              value: "Select Seat Type",
              child: Text("Select Seat Type"),
            ),
            DropdownMenuItem<String>(
              value: "GOPEN",
              child: Text("GOPEN"),
            ),
            DropdownMenuItem<String>(
              value: "LOPEN",
              child: Text("LOPEN"),
            ),
            DropdownMenuItem<String>(
              value: "GOBC",
              child: Text("GOBC"),
            ),
            DropdownMenuItem<String>(
              value: "LOBC",
              child: Text("LOBC"),
            ),
            DropdownMenuItem<String>(
              value: "SC/ST",
              child: Text("SC/ST"),
            ),
            DropdownMenuItem<String>(
              value: "NT-(A/B/C/D)",
              child: Text("NT-(A/B/C/D)"),
            ),
            DropdownMenuItem<String>(
              value: "Minority",
              child: Text("Minority"),
            ),
            DropdownMenuItem<String>(
              value: "PWD",
              child: Text("PWD"),
            ),
          ],
        ),
      ),
      // Add a spacer
      const SizedBox(width: 8),
    ],
  ),
),

                  SizedBox(height: 16),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter the General Merit No.';
          } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
            return 'Please enter only digits';
          }
          return null;
        },
        onChanged: (value) {
          generalMeritNo = value;
        },
        decoration: const InputDecoration(
          labelText: "General Merit No.",
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          hintText: "Enter General Merit No.",
          filled: true,
          fillColor: Color.fromARGB(255, 255, 253, 208),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
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
                            value: categoryDropDown,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? newValue) {
                              setState(() {
                                categoryDropDown = newValue!;
                              });
                              category = newValue!;
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: "Select your category",
                                child: Text("Select your category"),
                              ),
                              DropdownMenuItem<String>(
                                value: "OPEN",
                                child: Text("OPEN"),
                              ),
                              DropdownMenuItem<String>(
                                value: "OBC",
                                child: Text("OBC"),
                              ),
                              DropdownMenuItem<String>(
                                value: "SC/ST",
                                child: Text("SC/ST"),
                              ),
                              DropdownMenuItem<String>(
                                value: "NT-A,B,C,D",
                                child: Text("NT-A,B,C,D"),
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
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              readOnly: true,
                              controller: TextEditingController(
                                text: "${admissionSelectedDate.toLocal()}"
                                    .split(' ')[0],
                              ),
                              decoration: const InputDecoration(
                                labelText: "Select admission date",
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                hintText: "Select admission date",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                          onChanged: (value) {
                            guardianName = value;
                          },
                          decoration: const InputDecoration(
                            labelText: "Local Guardian",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Name of Local Guardian",
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
                          onChanged: (value) {
                            guardianMobile = value;
                          },
                          decoration: const InputDecoration(
                            labelText: "Guardian's Contact",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            hintText: "Contact of Local Guardian",
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

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _agreedTo,
                              onChanged: (bool? value) {
                                setState(() {
                                  _agreedTo = value ?? false;
                                });
                              },
                            ),
                            Text(
                              'I confirm that given information is correct !',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 19),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && _agreedTo) {
                        // Validation successful, navigate to home page
                        DatabaseService.addStudentData(
                            name,
                            email,
                            mobile,
                            homeAddress,
                            buildingNo,
                            locality,
                            district,
                            city,
                            pinCode,
                            gender,
                            parentName,
                            parentMobile,
                            regId,
                            program,
                            branch,
                            year,
                            generalMeritNo,
                            seatType,
                            category,
                            admissionDate,
                            guardianName,
                            guardianMobile);
                        showSnackBar(context, Colors.green,
                            "Student registered successfully!");
                        nextScreen(context, HomePage());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _agreedTo
                            ? Color.fromARGB(255, 190, 124, 37)
                            : Colors.grey),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
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
