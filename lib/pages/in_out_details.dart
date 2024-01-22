import 'package:flutter/material.dart';

class InOutDetailsList extends StatefulWidget {
  const InOutDetailsList({Key? key}) : super(key: key);

  @override
  _InOutDetailsListState createState() => _InOutDetailsListState();
}

class _InOutDetailsListState extends State<InOutDetailsList> {
  static const primaryColor = Color.fromARGB(255, 249, 249, 249);

  // Sample list of in-out details
  List<InOutDetails> inOutDetailsList = [
    InOutDetails(
      name: 'John Doe',
      date: '2022-03-01',
      outTime: '08:00 AM',
      inTime: '05:00 PM',
      reason: 'Medical Appointment',
      location: 'Hospital',
      studentPhoneNumber: '123-456-7890',
      parentPhoneNumber: '987-654-3210',
      roomNumber: '102',
    ),
    // Add more in-out details as needed
  ];

  // Filtered list based on search query
  List<InOutDetails> filteredDetails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('InOut Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: InOutDetailsSearch(inOutDetailsList));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredDetails.length == 0
            ? inOutDetailsList.length
            : filteredDetails.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: Colors.white.withOpacity(0.9),
            child: ListTile(
              title: Text(
                filteredDetails.length == 0
                    ? inOutDetailsList[index].name
                    : filteredDetails[index].name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    'Date: ${filteredDetails.length == 0 ? inOutDetailsList[index].date : filteredDetails[index].date}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Out Time: ${filteredDetails.length == 0 ? inOutDetailsList[index].outTime : filteredDetails[index].outTime}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'In Time: ${filteredDetails.length == 0 ? inOutDetailsList[index].inTime : filteredDetails[index].inTime}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Reason: ${filteredDetails.length == 0 ? inOutDetailsList[index].reason : filteredDetails[index].reason}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Location: ${filteredDetails.length == 0 ? inOutDetailsList[index].location : filteredDetails[index].location}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Student Phone Number: ${filteredDetails.length == 0 ? inOutDetailsList[index].studentPhoneNumber : filteredDetails[index].studentPhoneNumber}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Parent Phone Number: ${filteredDetails.length == 0 ? inOutDetailsList[index].parentPhoneNumber : filteredDetails[index].parentPhoneNumber}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Room Number: ${filteredDetails.length == 0 ? inOutDetailsList[index].roomNumber : filteredDetails[index].roomNumber}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  // Add your logic for accepting the request
                },
                child: const Text('Accept'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class InOutDetailsSearch extends SearchDelegate<String> {
  final List<InOutDetails> inOutDetailsList;

  InOutDetailsSearch(this.inOutDetailsList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList(inOutDetailsList
        .where((details) => details.name.contains(query))
        .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildList(inOutDetailsList
        .where((details) => details.name.contains(query))
        .toList());
  }

  Widget _buildList(List<InOutDetails> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            results[index].name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Text(
                'Date: ${results[index].date}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Out Time: ${results[index].outTime}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'In Time: ${results[index].inTime}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Reason: ${results[index].reason}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Location: ${results[index].location}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Student Phone Number: ${results[index].studentPhoneNumber}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Parent Phone Number: ${results[index].parentPhoneNumber}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Room Number: ${results[index].roomNumber}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              // Handle button tap
              // Add your logic for accepting the request
            },
            child: const Text('Accept'),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class InOutDetails {
  final String name;
  final String date;
  final String outTime;
  final String inTime;
  final String reason;
  final String location;
  final String studentPhoneNumber;
  final String parentPhoneNumber;
  final String roomNumber;

  InOutDetails({
    required this.name,
    required this.date,
    required this.outTime,
    required this.inTime,
    required this.reason,
    required this.location,
    required this.studentPhoneNumber,
    required this.parentPhoneNumber,
    required this.roomNumber,
  });
}
