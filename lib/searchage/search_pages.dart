import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Rasmlar ro'yxati
  final List<String> imagePaths = List.generate(30, (index) => 'images/i${index + 1}.jpg');
  final List<Nomlar> a = [
    Nomlar(nom: "Style"),
    Nomlar(nom: "Sports"),
    Nomlar(nom: "Auto"),
    Nomlar(nom: "Cosmetik"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 1,
        title: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            onChanged: (text) {
              // Qidiruv funksiyasi
              setState(() {
                // Filtrlash yoki qidirish natijalarini yangilash
                // Hozircha bo'sh, lekin siz bu yerga qidiruv mexanizmini qo'shishingiz mumkin
              });
            },
          ),
        ),
      ),
      body: Column(
        children: [
          _horizontalScroll(),
          Expanded(
            child: MasonryGridView.builder(
              gridDelegate:
                  SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: imagePaths.length, // Rasmlar soni
              itemBuilder: (context, ind) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullImageScreen(imagePath: imagePaths[ind]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(imagePaths[ind], fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _horizontalScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _customIconButton(CupertinoIcons.tv_fill, "IGTV"),
          _customIconButton(Icons.shopping_bag_rounded, "Shop"),
          Row(children: a.map((e) => elements(e)).toList()), // Ro'yxatni to'g'ri joylash
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

  Widget elements(Nomlar s) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            s.nom, // Null emas, to'g'ridan-to'g'ri chaqiriladi
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

class FullImageScreen extends StatelessWidget {
  final String imagePath;

  FullImageScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}

class Nomlar {
  String nom;
  Nomlar({required this.nom});
}
