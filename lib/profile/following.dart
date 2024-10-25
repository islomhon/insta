import 'package:flutter/material.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              'images1/islomhon.jpg',
            ),
          ),
          title: Text("Krypt0n_01"),
          trailing: ElevatedButton(
            onPressed: () {
              // Tugmachani bosgan holda chop etish
              
            },
            child: Text('Following'),
          ),
        ),);
  }
}