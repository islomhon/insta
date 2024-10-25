
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listmessg extends StatefulWidget {
  const listmessg({super.key});

  @override
  State<listmessg> createState() => _listmessgState();
}

class _listmessgState extends State<listmessg> {
  List<Story> stories = [
   Story(rasm: "images/i0.jpg", nom: "Rengo_ku", profileImage: "images/profile1.jpg"),
    Story(rasm: "images/i1.jpg", nom: "tan_jiro", profileImage: "images/profile2.jpg"),
    Story(rasm: "images/i2.jpg", nom: "Rizo_chik", profileImage: "images/profile3.jpg"),
    Story(rasm: "images/i3.jpg", nom: "ayup_mod", profileImage: "images/profile4.jpg"),
    Story(rasm: "images/i4.jpg", nom: "ron_jiro", profileImage: "images/profile5.jpg"),
    Story(rasm: "images/i5.jpg", nom: "maymun_jiro", profileImage: "images/profile6.jpg"),
    Story(rasm: "images/i6.jpg", nom: "oltin_tosh", profileImage: "images/profile7.jpg"),
    Story(rasm: "images/i7.jpg", nom: "tan_siru", profileImage: "images/profile8.jpg"),
    Story(rasm: "images/i8.jpg", nom: "tan_miku", profileImage: "images/profile9.jpg"),
    Story(rasm: "images/i9.jpg", nom: "gaabi_jiro", profileImage: "images/profile10.jpg"),
  ];

  Widget storyItem(Story story) {
    return GestureDetector(
      // Open story on tap
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 12),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(story.rasm!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 3),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.purple],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            Text(story.nom!, style: TextStyle(fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: stories.map((story) => storyItem(story)).toList(),
      ),
    );
  }
}

class Story {
  String? rasm;
  String? nom;
  String? profileImage; // Added profile image path

  Story({this.nom, this.rasm, this.profileImage});
}
