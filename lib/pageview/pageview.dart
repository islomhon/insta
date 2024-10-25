import 'package:flutter/material.dart';
import 'package:instagram1/hom_page/hompage.dart';
import 'package:instagram1/hom_page/messages/messages.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // PageController to manage the PageView
  PageController _pageController = PageController();

  // Variable to keep track of the current page
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Hompage(),
                nommessage(),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
  // Function to build the dots indicator
 
