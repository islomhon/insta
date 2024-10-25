import 'package:flutter/material.dart';
import 'dart:math';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Your Subscribers')),
        ),
        body: RandomUsersList(),
      
    );
  }
}

class RandomUsersList extends StatefulWidget {
  @override
  _RandomUsersListState createState() => _RandomUsersListState();
}

class _RandomUsersListState extends State<RandomUsersList> {
  final Random random = Random();
  
  // List of actual names
  final List<String> names = [
    'John Doe', 'Jane Smith', 'Michael Johnson', 'Emily Davis',
    'William Brown', 'Sophia Wilson', 'James Garcia', 'Olivia Martinez',
    'Benjamin Rodriguez', 'Ava Hernandez', 'Lucas Anderson', 'Mia Thomas',
    'odrigfwerffefeeeuez', 'Ava H', 'Lucasefeffeef Anderson', 'feewferThomas',
    'Ethan Tayledewror', 'Charlotte Moore', 'Alexander Jackson', 'Amelia White',
    'Etdwfrgeger', 'Charewedew', 'mandndde', 'momc',
    // Add more names as needed
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter the names based on the search query
    List<String> filteredNames = names.where((name) {
      return name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value; // Update the search query
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search by name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        // User list
        Expanded(
          child: ListView.builder(
            itemCount: filteredNames.length, // Use filtered names count
            itemBuilder: (context, index) {
              String randomName = filteredNames[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/${random.nextInt(100)}.jpg',
                  ),
                ),
                title: Text(randomName),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Print message when button is pressed
                    print('$randomName izdoshlari bor');
                  },
                  child: Text('Followers'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}
