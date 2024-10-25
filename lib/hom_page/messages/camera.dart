import 'package:flutter/material.dart';

class Caera extends StatefulWidget {
  const Caera({super.key});

  @override
  State<Caera> createState() => _CaeraState();
}

class _CaeraState extends State<Caera> {
  final List<ChatItemData> chatItems = [
    ChatItemData(
      profileUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      name: 'joshua_l',
      message: 'Have a nice day, bro!',
      timeAgo: 'now',
    ),
    ChatItemData(
      profileUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      name: 'karenne',
      message: 'I heard this is a good movie, s...',
      timeAgo: 'now',
    ),
    ChatItemData(
      profileUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      name: 'martini_rond',
      message: 'See you on the next meeting!',
      timeAgo: '15m',
    ),
    ChatItemData(
      profileUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
      name: 'andrewww_',
      message: 'Sounds good 😂😂😂',
      timeAgo: '20m',
    ),
    ChatItemData(
      profileUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
      name: 'kiero_d',
      message: 'The new design looks cool, b...',
      timeAgo: '1m',
    ),
    ChatItemData(
      profileUrl: 'https://randomuser.me/api/portraits/men/6.jpg',
      name: 'maxjacobson',
      message: 'Thank you, bro!',
      timeAgo: '2h',
    ),
    ChatItemData(
      profileUrl: 'https://randomuser.me/api/portraits/women/7.jpg',
      name: 'jamie.franco',
      message: 'Yeap, I\'m going to travel in To...',
      timeAgo: '4h',
    ),
    ChatItemData(
      profileUrl: 'https://randomuser.me/api/portraits/women/8.jpg',
      name: 'm_humphrey',
      message: 'Instagram UI is pretty good',
      timeAgo: '5h',
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter the chat items based on the search query
    List<ChatItemData> filteredChatItems = chatItems.where((item) {
      return item.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Camera')),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle add new chat
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value; // Update the search query
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Chat List
          Expanded(
            child: ListView.builder(
              itemCount: filteredChatItems.length,
              itemBuilder: (context, index) {
                final item = filteredChatItems[index];
                return ChatItem(
                  profileUrl: item.profileUrl,
                  name: item.name,
                  message: item.message,
                  timeAgo: item.timeAgo,
                );
              },
            ),
          ),
          // Camera Button
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle camera action
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Camera'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                foregroundColor: Colors.blue,
                shape: StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String profileUrl;
  final String name;
  final String message;
  final String timeAgo;

  ChatItem({
    required this.profileUrl,
    required this.name,
    required this.message,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(profileUrl),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(timeAgo, style: TextStyle(color: Colors.grey)),
          Icon(Icons.camera_alt, color: Colors.grey),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(name: name, profileUrl: profileUrl),
          ),
        );
      },
    );
  }
}

// Data class for ChatItem
class ChatItemData {
  final String profileUrl;
  final String name;
  final String message;
  final String timeAgo;

  ChatItemData({
    required this.profileUrl,
    required this.name,
    required this.message,
    required this.timeAgo,
  });
}

// Chat Detail Screen
class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String profileUrl;

  ChatDetailScreen({required this.name, required this.profileUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(profileUrl),
            ),
            SizedBox(width: 10),
            Text(name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Placeholder for messages
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('Hey! How are you?'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('I\'m good, thanks! What about you?'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Message Input Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle send action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
