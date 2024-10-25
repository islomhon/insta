import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/add/add.dart';
import 'package:instagram1/hom_page/hompage.dart';
import 'package:instagram1/notification/notification.dart';
import 'package:instagram1/pageview/pageview.dart';
import 'package:instagram1/profile/Myprofile.dart';
import 'package:instagram1/searchage/search_pages.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool a = true;
  int _selectedIndex = 0; // To keep track of the selected bottom nav bar item

  // Method to change the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of widgets for different tabs
  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(), // For Home Page (Instagram feed)
    SearchPage(), // Search Tab
    Add(), // Add Post Tab
    NotificationsScreen(), // Notifications Tab
    MyProfile()
  ];

  @override
  Widget build(BuildContext context) {
    // Detect current theme mode

    return Scaffold(
      body: _widgetOptions[_selectedIndex], // Show the selected page's content
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('images/i31.jpg'), // Profile image
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped, // Handle tap on navigation bar item
      ),
    );
  }
}
