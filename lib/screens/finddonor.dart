import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FindDonor extends StatefulWidget {
  @override
  _FindDonorState createState() => _FindDonorState();
}

class _FindDonorState extends State<FindDonor> {
  final databaseReference = FirebaseDatabase.instance.reference();

  // Example function to fetch data from Firebase
  Future<void> fetchData() async {
  try {
    // Assuming your data is stored under a 'donors' node in the database
    DataSnapshot snapshot = (await databaseReference.child('donors').once()) as DataSnapshot;
    Object? values = snapshot.value;
    // Now you can process the data and update the UI
    print(values);
  } catch (error) {
    print('Error fetching data: $error');
  }
}
  @override
  void initState() {
    super.initState();
    fetchData(); // Call the function when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Donation Finder'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Image(
                  image: AssetImage('assets/applogo.png'), // Add your logo image to assets
                  height: 100,
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Find Donor',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'FIND THE CLOSEST BLOOD DONOR',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.grey.withOpacity(0.5), // Add shadow color
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Blood type',
                        ),
                        items: <String>['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'City',
                        ),
                        items: <String>['City 1', 'City 2', 'City 3', 'City 4']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Province',
                        ),
                        items: <String>['Province 1', 'Province 2', 'Province 3', 'Province 4']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle find blood action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Find Blood'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'About us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Blood Donation Finder - Sri Lanka\n'
                'Are you in need of blood or looking to make a life-saving donation in\n'
                'Sri Lanka? Our Blood Donation Finder website is here to connect donors with those in need.\n\n'
                'Key Features:\n'
                '• Easy Search: Quickly find nearby blood donation centers and upcoming donation events.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}