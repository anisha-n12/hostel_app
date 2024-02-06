import 'package:flutter/material.dart';
import 'package:hostel_app/pages/studentpage.dart';
import 'package:hostel_app/service/database_service.dart';
import 'package:hostel_app/widgets/widgets.dart';

class Profile_pg extends StatefulWidget {
  final String name;
  final String block;
  final String room;
  final String mobile;
  final String email;
  final String parentContact;

  const Profile_pg({
    Key? key,
    required this.name,
    required this.block,
    required this.room,
    required this.mobile,
    required this.email,
    required this.parentContact,
    // required this.currentpass,
    // required this.newpass
  }) : super(key: key);

  @override
  State<Profile_pg> createState() => _Profile_pgState();
}

class _Profile_pgState extends State<Profile_pg> {
  String currentpass = "";
  String newpass = "";
  String newcontact = "";
  String newparentContact = "";
  bool isEditing = false;
  bool isVerified = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Your Profile",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 220, 212, 170),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              nextScreen(context, StudentPage());
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
              icon: const Icon(Icons.edit),
              color: Colors.black,
            )
          ],
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 410,
                    height: 300,
                    child: Image.asset(
                      "lib/assets/images/profile2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        '${widget.name}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: 10),
                      Text(
                          'Block: ${widget.block.substring(widget.block.length - 1)}'),
                      Text('Room: ${widget.room}'),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) {
                          newcontact = value;
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
                        enabled: isEditing,
                        initialValue: widget.mobile,
                        decoration: InputDecoration(
                          labelText: 'Contact',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Enter your mobile number',
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 253, 208),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        enabled: isEditing,
                        onChanged: (value) {
                          newparentContact = value;
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
                        initialValue: widget.parentContact,
                        decoration: InputDecoration(
                          labelText: 'Parent\'s contact number',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Enter your Parent\'s contact number',
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 253, 208),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          DatabaseService.updateMobileAndParentMobile(
                              context, newcontact, newparentContact);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isEditing
                                ? Color.fromARGB(255, 190, 124, 37)
                                : Colors.grey),
                        child: Text("Update"),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Reset Password',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        enabled: isEditing,
                        onChanged: (value) {
                          currentpass = value;
                        },
                        // controller: currentPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Current Password',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Enter your current password',
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 253, 208),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isVerified =
                                DatabaseService.checkPassword(currentpass);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isEditing
                                ? Color.fromARGB(255, 190, 124, 37)
                                : Colors.grey),
                        child: Text("Verify"),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        enabled: isVerified,
                        // controller: newPasswordController,
                        onChanged: (value) {
                          newpass = value;
                        },

                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Enter your new password',
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 253, 208),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        enabled: isVerified,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your Password';
                          } else if (value != newpass) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: 'Confirm your new password',
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 253, 208),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        
                        onPressed: () {
                          if (isVerified) {
                            DatabaseService.resetPasswordForCurrentUser(
                                context, newpass, "Student");
                          } else {
                            showSnackBar(context, Colors.red,
                                "Verify current password first!");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isVerified
                              ? Color.fromARGB(255, 190, 124, 37)
                              : Colors.grey,
                        ),
                        child: Text("Reset Password"),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }

  Future<void> getuserdata() async {
    Map<String, dynamic>? studentData =
        await DatabaseService.getCurrentUserData();
    // name = studentData!['name'];
    // room = studentData['room'];
    // block = studentData['block'];
    // mobilenum = studentData['mobile'];
    // parent_contact = studentData['parentMobile'];
  }
}
