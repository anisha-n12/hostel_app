import 'package:flutter/material.dart';
import 'package:hostel_app/pages/guest_form.dart';
import 'package:hostel_app/pages/homeinfo.dart';
import 'package:hostel_app/pages/login_page.dart';
import 'package:hostel_app/pages/reg_page.dart';
import 'package:hostel_app/pages/studentpage.dart';
import 'package:hostel_app/shared/constants.dart';
import 'package:hostel_app/widgets/widgets.dart';
import 'package:marquee/marquee.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    HomeInfo(),
    FormsPage(),
    ContactPage(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        title: const Text(
          "Home",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 320,
                ),
                ElevatedButton(
                  onPressed: () {
                    nextScreen(context, LoginPage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Login"),
                ),
              ],
            ),
            Center(
              child: _pages.elementAt(_selectedIndex), //New
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 30),
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constants.primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Forms',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade_rounded),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              nextScreen(context, Register_Page());
            },
            child: const ListTile(
              leading: Icon(Icons.article_rounded),
              title: Text("Registration form",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text("Register for the allotment procedure"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              nextScreen(context, GuestForm());
            },
            child: const ListTile(
              leading: Icon(Icons.article_rounded),
              title: Text("Guest form",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text("Apply for guest room allotment"),
            ),
          ),
        ),
      ]),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'VJTI Hostel',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(height: 16),
          Center(
              child: Text(
            'Girl\'s Hostel',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Rules and Regulations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '- Usage of Reading room and other amenities should be made with care and students should not damage any of the stuff.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
              child: Text(
            'Boy\'s Hostel',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Rules and Regulations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '- Usage of Reading room and other amenities should be made with care and students should not damage any of the stuff.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("Head Rector",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text("Dr. Bambole - 1234567890"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("Girls Hostel Rector",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(" Dr. S. S. Suratkar- 1234567890"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("Boys Hostel Rector",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(" XYZ- 1234567890"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("A Block Hostel Incharge",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(" XYZ- 1234567890"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("B Block Hostel Incharge",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(" XYZ- 1234567890"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("C Block Hostel Incharge",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(" XYZ- 1234567890"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("D Block Hostel Incharge",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(" XYZ- 1234567890"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("E Block Hostel Incharge",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(" XYZ- 1234567890"),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: const ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text("PG Boys Hostel Incharge",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(" XYZ- 1234567890"),
            ),
          ),
        ),
      ]),
    );
  }
}
