import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  // Define your image paths here
  final List<String> imagePaths = [
    'images/i1.jpg', // Replace with your actual image paths
    'images/i2.jpg', // Replace with your actual image paths
    'images/i3.jpg', // Replace with your actual image paths
    'images/i4.jpg', // Replace with your actual image paths
    'images/i5.jpg', // Replace with your actual image paths
    'images/i6.jpg', // Replace with your actual image paths
    'images/i7.jpg', // Replace with your actual image paths
    'images/i8.jpg', // Replace with your actual image paths
    'images/i9.jpg', // Replace with your actual image paths
    'images/i10.jpg', // Replace with your actual image paths
    'images/i11.jpg', // Replace with your actual image paths
    'images/i12.jpg', // Replace with your actual image paths
    'images/i13.jpg', // Replace with your actual image paths
    'images/i14.jpg', // Replace with your actual image paths
    'images/i15.jpg', // Replace with your actual image paths
    'images/i16.jpg', // Replace with your actual image paths
    'images/i17.jpg', // Replace with your actual image paths
    'images/i18.jpg', // Replace with your actual image paths
    'images/i19.jpg', // Replace with your actual image paths
    'images/i20.jpg', // Replace with your actual image paths
   
    // Add more images as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Image Gallery'),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: MasonryGridView.builder(
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullImageScreen(imagePath: imagePaths[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customIconButton(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(icon, color: Colors.black54, size: 20),
              SizedBox(width: 5),
              Text(label,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            ],
          ),
        ),
      ),
    );
  }
}

// FullImageScreen widget to display the selected image in full screen
class FullImageScreen extends StatelessWidget {
  final String imagePath;

  FullImageScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(imagePath), // Show the selected image
      ),
    );
  }
}
