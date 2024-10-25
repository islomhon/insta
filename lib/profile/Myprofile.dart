import 'package:flutter/material.dart';
import 'package:instagram1/log%20in%20page/ikkinshilogin.dart';
import 'package:instagram1/profile/edit_profile.dart';
import 'package:instagram1/profile/followers.dart';
import 'package:instagram1/profile/following.dart';
import 'package:instagram1/profile/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String name = "User Name";
  String username = "username";
  String website = "";
  String bio = "";

  final List<String> assetImages = [
    "images/i0.jpg",
    "images/i1.jpg",
    "images/i2.jpg",
    "images/i3.jpg",
    "images/i4.jpg",
    "images/i5.jpg",
    "images/i6.jpg",
    "images/i7.jpg",
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? name;
      username = prefs.getString('username') ?? username;
      website = prefs.getString('website') ?? website;
      bio = prefs.getString('bio') ?? bio;
    });
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('username', username);
    await prefs.setString('website', website);
    await prefs.setString('bio', bio);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock),
              Text(name),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(username),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('images/i31.jpg'),
                ),
              ),
              _buildDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () => Navigator.pop(context),
              ),
              _buildDrawerItem(
                icon: Icons.person,
                text: 'Profile',
                onTap: () => Navigator.pop(context),
              ),
              _buildDrawerItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                ),
              ),
              _buildDrawerItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: _logout,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(context),
              _buildBioSection(),
              _buildEditProfileButton(context),
              _buildStoryHighlights(),
              _buildTabBarContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const loginstatus()),
      (route) => false,
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/i31.jpg'),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn("8", "Posts"),
                _buildFollowerSection(context),
                _buildFollowingSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(bio),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildEditProfileButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OutlinedButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfile(
                currentName: name,
                currentUsername: username,
                currentWebsite: website,
                currentBio: bio,
              ),
            ),
          );
          if (result != null) {
            setState(() {
              name = result['name'];
              username = result['username'];
              website = result['website'];
              bio = result['bio'];
            });
            await _saveProfileData();
          }
        },
        child: const Text("Edit Profile"),
      ),
    );
  }

  Widget _buildStoryHighlights() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildStoryHighlight("New", Icons.add),
            _buildStoryHighlight("Friends", Icons.person),
            _buildStoryHighlight("Sport", Icons.sports),
            _buildStoryHighlight("Design", Icons.palette),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowerSection(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Following()),
      ),
      child: _buildStatColumn("999", "Followers"),
    );
  }

  Widget _buildFollowingSection(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Following()),
      ),
      child: _buildStatColumn("1", "Following"),
    );
  }

  Widget _buildTabBarContent(BuildContext context) {
    return Column(
      children: [
        const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.grid_on)),
            Tab(icon: Icon(Icons.portrait)),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: [
              _buildGridView(),
              const Center(child: Text('Second tab content')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: assetImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullImageScreen(
                  imagePath: assetImages[index],
                ),
              ),
            );
          },
          child: Image.asset(
            assetImages[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildStoryHighlight(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey.shade300,
            child: Icon(icon, size: 30, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class FullImageScreen extends StatelessWidget {
  final String imagePath;

  const FullImageScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
