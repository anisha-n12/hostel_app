import 'package:flutter/material.dart';
import 'package:hostel_app/pages/homepage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GuestForm extends StatefulWidget {
  const GuestForm({super.key});

  @override
  State<GuestForm> createState() => _GuestFormState();
}

class _GuestFormState extends State<GuestForm> {
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  bool? ischecked = false;
  bool? showerror = false;

  final _key = GlobalKey<FormState>();
  bool isLoading = false;

  final spinkit =
      const SpinKitChasingDots(color: Colors.orangeAccent, size: 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Guest Form",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 220, 212, 170),
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {}),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _key,
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.holiday_village_outlined,
                        size: 130,
                        color: Colors.brown,
                      ),
                      const Text(
                        "Fill in the details Below",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.brown),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Checkout Time : 8:00 A.M",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 201, 137, 76),
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 105.0),
                        child: TextFormField(
                          // "Cost per day: \nVJTI student : Rs 100\nGuest             : Rs 400\n"
                          decoration: const InputDecoration(
                            labelText:
                                "Cost per day: \n VJTI student : Rs 100\n Guest             : Rs 400",
                            labelStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                          "Note:*The amount is to be paid in Account section of VJTI",
                          style: TextStyle(
                              color: Color.fromARGB(255, 201, 137, 76),
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 15),
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
                                labelText: "Applicants Name",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                hintText: "Enter your Name",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
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
                                labelText: "Permanent residential address",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                hintText: "Enter your Address",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
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
                                labelText: "Mention College/School name",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                hintText: "Enter College/School name",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
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
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                hintText: "Enter your Phone no",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
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
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Mention Reason",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                hintText: "Enter your reason",
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 253, 208),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Date of arrival ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 253, 208),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                        hintText:
                                            "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    final DateTime? dateTime =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate1,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(3000),
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Theme(
                                          data: ThemeData.light().copyWith(
                                            primaryColor: const Color.fromARGB(
                                                255, 199, 138, 57),
                                            // Set your desired color here
                                            colorScheme:
                                                const ColorScheme.light(
                                                    primary: Color.fromARGB(
                                                        255, 168, 114, 42)),
                                            buttonTheme: const ButtonThemeData(
                                                textTheme:
                                                    ButtonTextTheme.primary),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (dateTime != null) {
                                      setState(() {
                                        selectedDate1 = dateTime;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.calendar_month),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Date of Departure ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 253, 208),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            "${selectedDate2.day}-${selectedDate2.month}-${selectedDate2.year}",
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    final DateTime? datTime =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate2,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(3000),
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Theme(
                                          data: ThemeData.light().copyWith(
                                            primaryColor: const Color.fromARGB(
                                                255,
                                                199,
                                                138,
                                                57), // Set your desired color here
                                            colorScheme:
                                                const ColorScheme.light(
                                                    primary: Color.fromARGB(
                                                        255, 168, 114, 42)),
                                            buttonTheme: const ButtonThemeData(
                                                textTheme:
                                                    ButtonTextTheme.primary),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );
                                    if (datTime != null) {
                                      setState(() {
                                        selectedDate2 = datTime;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.calendar_month),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "I,as mentioned above apply for guest house/Hostel accomodation for the given period mentioned above and i am willing to pay in advance the usual fees/charges for short stay in the guest house/Hostels.I undertake to abide by the rules and regulation and discipline of the institute as they apply to its regular students guest and as laid down from time to time.I understand that the Institute will not be responsible for any damage,injury or loss of property that I may suffer during my period of stay.I undertake to make my own messing arrangements and will vacate the premises in good condition on the expiry of the said period.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0),
                        child: Row(
                          children: [
                            Checkbox(
                                value: ischecked,
                                activeColor: Colors.orangeAccent,
                                onChanged: (newBool) {
                                  setState(() {
                                    ischecked = newBool;
                                    showerror = false;
                                  });
                                }),
                            const Text(
                              "I agree to all the above condition.",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            if (showerror != null && showerror!)
                              const Text(
                                "Please agree to the conditions.",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              )
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
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
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                          );
                        },
                        child: Text("Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                        color: const Color.fromARGB(255, 173, 103, 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
