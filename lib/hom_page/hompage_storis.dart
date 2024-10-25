import 'package:flutter/material.dart';

class HomepageStories extends StatefulWidget {
  const HomepageStories({Key? key}) : super(key: key);

  @override
  State<HomepageStories> createState() => _HomepageStoriesState();
}

class _HomepageStoriesState extends State<HomepageStories> {
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

  void _openStory(Story story) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StoryViewScreen(story: story),
      ),
    );
  }

  Widget storyItem(Story story) {
    return GestureDetector(
      onTap: () => _openStory(story), // Open story on tap
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
                    border: Border.all(color: Colors.white, width: 3),
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

// StoryViewScreen to display the selected story
class StoryViewScreen extends StatelessWidget {
  final Story story;

  const StoryViewScreen({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Story image
          Center(
            child: Image.asset(
              story.rasm!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Profile picture
          Positioned(
            top: 40,
            left: 20,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(story.rasm!),
                ),
                SizedBox(height: 5),
                Text(
                  story.nom!,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Close button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
