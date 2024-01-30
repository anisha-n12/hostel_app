import 'package:flutter/material.dart';

class AllotStudentList extends StatefulWidget {
  const AllotStudentList({Key? key}) : super(key: key);

  @override
  _AllotStudentListState createState() => _AllotStudentListState();
}

class _AllotStudentListState extends State<AllotStudentList> {
  static const primaryColor = Color.fromARGB(255, 249, 249, 249);

  // Sample list of in-out details
  List<AllotStudent> inOutDetailsList = [
    AllotStudent(
      name: 'John Doe11',
      date: '2022-03-01',
      address: 'Sample Address',
      gender: 'Male',
      studentPhoneNumber: '123-456-7890',
      category: 'Category A',
      program: 'Sample Program',
      branch: 'Sample Branch',
      year: '1st',
      regID: 'ABC123',
    ),
    // Add more in-out details as needed
  ];

  // Filtered list based on search query
  List<AllotStudent> filteredDetails = [];

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
                    'Address: ${filteredDetails.length == 0 ? inOutDetailsList[index].address : filteredDetails[index].address}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Gender: ${filteredDetails.length == 0 ? inOutDetailsList[index].gender : filteredDetails[index].gender}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Reg. ID: ${filteredDetails.length == 0 ? inOutDetailsList[index].regID : filteredDetails[index].regID}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    'Studies: ${filteredDetails.length == 0 ? inOutDetailsList[index].program : filteredDetails[index].program} | ${filteredDetails.length == 0 ? inOutDetailsList[index].branch : filteredDetails[index].branch} : ${filteredDetails.length == 0 ? inOutDetailsList[index].year : filteredDetails[index].year} year',
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
                    'Category: ${filteredDetails.length == 0 ? inOutDetailsList[index].category : filteredDetails[index].category}',
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
  final List<AllotStudent> inOutDetailsList;

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

  Widget _buildList(List<AllotStudent> results) {
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
                'Ad. Date: ${results[index].date}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Address: ${results[index].address}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Gender: ${results[index].gender}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Reg. ID: ${results[index].regID}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Studies: ${results[index].program} | ${results[index].branch} : ${results[index].year} year',
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
                'Category: ${results[index].category}',
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

class AllotStudent {
  final String name;
  final String date;
  final String address;
  final String gender;
  final String studentPhoneNumber;
  final String category;
  final String program;
  final String branch;
  final String year;
  final String regID;

  AllotStudent({
    required this.name,
    required this.date,
    required this.address,
    required this.gender,
    required this.studentPhoneNumber,
    required this.category,
    required this.program,
    required this.branch,
    required this.year,
    required this.regID,
  });
}
