import 'package:flutter/material.dart';
// Import your message list file correctly
import 'package:instagram1/hom_page/messages/messGER_LIST.dart';

class nommessage extends StatefulWidget {
  const nommessage({super.key});

  @override
  State<nommessage> createState() => _nommessageState();
}

class _nommessageState extends State<nommessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(
          child:Text('Messages')
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle adding a new chat
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
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
            // Chat List Container
            Container(
              width: double.infinity,
              height: 100, // Adjust height if necessary
              child: listmessg(), // Ensure this function returns a widget
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Your contacts",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Theme",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ChatItem(
                    profileUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
                    name: 'joshua_l',
                    message: 'Have a nice day, bro!',
                    timeAgo: 'now',
                  ),
                  ChatItem(
                    profileUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
                    name: 'karenne',
                    message: 'I heard this is a good movie, s...',
                    timeAgo: 'now',
                  ),
                  ChatItem(
                    profileUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
                    name: 'martini_rond',
                    message: 'See you on the next meeting!',
                    timeAgo: '15m',
                  ),
                  ChatItem(
                    profileUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
                    name: 'andrewww_',
                    message: 'Sounds good 😂😂😂',
                    timeAgo: '20m',
                  ),
                ],
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

// Chat Detail Screen with message persistence and auto-reply
class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String profileUrl;

  ChatDetailScreen({required this.name, required this.profileUrl});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> messages = [];

  // Define predefined Uzbek messages and their responses
  Map<String, String> uzbekReplies = {
    'Assalomu aleykum': 'Va alaykum assalom.',
    'Salom': 'Salom.',
    'Axvollar qale': 'Yaxshi rahmat, uziz yaxshi misiz?',
    'Nimalar bilan bandsiz': 'Ishlarim bilan ovoraman.',
    'Ha bupti keynroq gaplashamiz bant busez': 'Aha mayli.',
    'Xayr': 'Hop hayr bupti.',
    'san kutmisan': 'aha chisti',
    'brat nechi yoshsiz': 'sanga nima',
    'yo prosta': 'uka dorini ichmadin shekili a',
    'pashol': 'kup gapirma hu telni orqasidan sakrisan',
    'nima buladi a': 'dabba uchir',
    'yaxshi misiz': 'aha uzischi',
    'kurishse buladimi': 'ha mayli qachan qayerda',
    'hozir qayttasiz': 'uydaman',
    'ha yangi bozorda kurishamiz': 'ha mayli buluradi',
    'kopponda kurishamiz': 'aha farqiyu',
    'gey bla xaromi': 'mani gey ligim bilan sani ishin bulmasin sanga nima man gey bulsam',
  };

  void sendMessage(String text) {
    setState(() {
      messages.add({'text': text, 'sender': 'me'});
      _messageController.clear();
    });

    // Check if the message is in the Uzbek predefined replies
    if (uzbekReplies.containsKey(text)) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          messages.add({'text': uzbekReplies[text]!, 'sender': 'other'});
        });
      });
    } 
    // Do nothing if the message is not a predefined Uzbek message
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(widget.profileUrl),
            ),
            SizedBox(width: 10),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isMe = messages[index]['sender'] == 'me';
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue[100] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(messages[index]['text']!),
                    ),
                  ),
                );
              },
            ),
          ),
          // Message Input Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onSubmitted: (text) {
                      if (_messageController.text.isNotEmpty) {
                        sendMessage(_messageController.text);
                      }
                    },
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
                    if (_messageController.text.isNotEmpty) {
                      sendMessage(_messageController.text);
                    }
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
