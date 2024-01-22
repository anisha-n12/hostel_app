import 'package:flutter/material.dart';

class Room_change extends StatefulWidget {
  const Room_change({Key? key}) : super(key: key);

  @override
  State<Room_change> createState() => _Room_changeState();
}

class _Room_changeState extends State<Room_change> {
  String dropDownValue = "Select your Hostel/block";
  String selectedCourse = "Select course";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Room Change Request",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 220, 212, 170),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 420,
                  height: 320,
                  child: Image.asset(
                    "lib/assets/images/Room.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Enter Correct Name';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter your Name",
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 254, 244),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.brown, width: 1.0)),
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Registration ID",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Enter Correct ID';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter Registration ID",
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 254, 244),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 1.0,
                            ),
                          ),
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Course",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                              height:
                                  2), // Adjust spacing between Text and DropdownButton

                          Container(
                            height: 45,
                            width: 520, // Set height based on screen height

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(4.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: DropdownButtonFormField<String>(
                                        isExpanded: true,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 255, 254, 244),
                                          border: InputBorder.none,
                                        ),
                                        hint: Text(
                                          selectedCourse ?? 'Select course',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: selectedCourse != null
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
                                        ),
                                        value: selectedCourse,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedCourse = newValue!;
                                          });
                                        },
                                        items: [
                                          'Select course',
                                          'Diploma in Civil Engineering',
                                          'Diploma in Textile Manufactures',
                                          'Diploma in Mechanical Engineering',
                                          'Diploma in Electronics Engineering',
                                          'Diploma in Chemical Engineering',
                                          'Diploma in Electrical Engineering',
                                          'B.Tech in Civil Engineering',
                                          'B.Tech in Electronics Engineering',
                                          'B.Tech in Electrical Engineering',
                                          'B.Tech in Mechanical Engineering',
                                          'B.Tech in EXTC Engineering',
                                          'B.Tech in Computer Engineering',
                                          'B.Tech in IT Engineering',
                                          'B.Tech in Production Engineering',
                                          'B.Tech in Textile Engineering',
                                          'M.Tech in Civil Engineering',
                                          'M.Tech in Electronics Engineering',
                                          'M.Tech in Electrical Engineering',
                                          'M.Tech in Mechanical Engineering',
                                          'M.Tech in EXTC Engineering',
                                          'M.Tech in Computer Engineering',
                                          'M.Tech in IT Engineering',
                                          'M.Tech in Production Engineering',
                                          'M.Tech in Textile Engineering',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Room No",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Room No",
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 254, 244),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 45,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 254, 244),
                        border: Border.all(color: Colors.brown),
                        borderRadius: BorderRadius.circular(4.0),
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
                            value: "Select your Hostel/block",
                            child: Text("Select your Hostel/block"),
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
                    const SizedBox(
                      height: 18,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Reason",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Specify your Reason",
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 254, 244),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Desired Hostel",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Desired Hostel",
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 254, 244),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 190, 124, 37)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
