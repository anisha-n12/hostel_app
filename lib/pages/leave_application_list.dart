import 'package:flutter/material.dart';

class LeaveList extends StatefulWidget {
  const LeaveList({Key? key}) : super(key: key);

  @override
  _LeaveListState createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  static const primaryColor = Color.fromARGB(255, 249, 249, 249);
  // static const secondaryColor = Color.fromARGB(255, 240, 216, 216);

  // Sample list of room change requests
  List<LeaveRequest> leaveRequests = [
    LeaveRequest(
      studentName: 'John Doe',
      numberOfDays: 3,
      leaveFrom: '2022-03-01',
      leaveTo: '2022-03-03',
      roomNumber: '102',
      reason: 'Family emergency',
      guardianContact: '123-456-7890',
    ),
    LeaveRequest(
      studentName: 'John Doe',
      numberOfDays: 3,
      leaveFrom: '2022-03-01',
      leaveTo: '2022-03-03',
      roomNumber: '102',
      reason: 'Family emergency',
      guardianContact: '123-456-7890',
    ),
    LeaveRequest(
      studentName: 'John Doe',
      numberOfDays: 3,
      leaveFrom: '2022-03-01',
      leaveTo: '2022-03-03',
      roomNumber: '102',
      reason: 'Family emergency',
      guardianContact: '123-456-7890',
    ),
    LeaveRequest(
      studentName: 'John Doe',
      numberOfDays: 3,
      leaveFrom: '2022-03-01',
      leaveTo: '2022-03-03',
      roomNumber: '102',
      reason: 'Family emergency',
      guardianContact: '123-456-7890',
    ),
    // Add more leave requests as needed
  ];

  // Filtered list based on search query
  List<LeaveRequest> filteredRequests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Leave Applications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: RoomChangeSearch(leaveRequests));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredRequests.length == 0
            ? leaveRequests.length
            : filteredRequests.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: Colors.white.withOpacity(0.9),
            child: ListTile(
              title: Text(
                filteredRequests.length == 0
                    ? leaveRequests[index].studentName
                    : filteredRequests[index].studentName,
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
                    'Number of Days: ${filteredRequests.length == 0 ? leaveRequests[index].numberOfDays : filteredRequests[index].numberOfDays}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Leave From: ${filteredRequests.length == 0 ? leaveRequests[index].leaveFrom : filteredRequests[index].leaveFrom}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Leave To: ${filteredRequests.length == 0 ? leaveRequests[index].leaveTo : filteredRequests[index].leaveTo}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Room No: ${filteredRequests.length == 0 ? leaveRequests[index].roomNumber : filteredRequests[index].roomNumber}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Reason: ${filteredRequests.length == 0 ? leaveRequests[index].reason : filteredRequests[index].reason}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Guardian Contact: ${filteredRequests.length == 0 ? leaveRequests[index].guardianContact : filteredRequests[index].guardianContact}',
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

class RoomChangeSearch extends SearchDelegate<String> {
  final List<LeaveRequest> leaveRequests;

  RoomChangeSearch(this.leaveRequests);

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
    return _buildList(leaveRequests
        .where((request) => request.studentName.contains(query))
        .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildList(leaveRequests
        .where((request) => request.studentName.contains(query))
        .toList());
  }

  Widget _buildList(List<LeaveRequest> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            results[index].studentName,
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
                'Number of Days: ${results[index].numberOfDays}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Leave From: ${results[index].leaveFrom}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Leave To: ${results[index].leaveTo}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Room No: ${results[index].roomNumber}',
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
                'Guardian Contact: ${results[index].guardianContact}',
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

class LeaveRequest {
  final String studentName;
  final int numberOfDays;
  final String leaveFrom;
  final String leaveTo;
  final String roomNumber;
  final String reason;
  final String guardianContact;

  LeaveRequest({
    required this.studentName,
    required this.numberOfDays,
    required this.leaveFrom,
    required this.leaveTo,
    required this.roomNumber,
    required this.reason,
    required this.guardianContact,
  });
}
