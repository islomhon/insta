import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/hom_page/hompage_instagram_post.dart';
import 'package:instagram1/hom_page/hompage_storis.dart';
import 'package:instagram1/hom_page/messages/camera.dart';
import 'package:instagram1/hom_page/messages/messages.dart';

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  bool a = true;

  void b() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 75.0,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            leading: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                icon: Icon(CupertinoIcons.camera, size: 30),
                onPressed: () {
                        // Direct Messenger action
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Caera(),));
                      },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Instagram',
                  style: TextStyle(
                    fontFamily: 'insta',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Stack(
                        children: [
                          Icon(Icons.live_tv_sharp, size: 30),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        // IGTV action
                      },
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.paperplane, size: 30),
                      onPressed: () {
                        // Direct Messenger action
                        Navigator.push(context, MaterialPageRoute(builder: (context) => nommessage(),));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    child: HomepageStories(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: HompageInstagramPost(),
                    width: double.infinity,
                  ),
                ),
                Container(
                  child: HomepageInstagramPost(),
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomepageInstagramPost extends StatefulWidget {
  const HomepageInstagramPost({super.key});

  @override
  State<HomepageInstagramPost> createState() => _HomepageInstagramPostState();
}

class _HomepageInstagramPostState extends State<HomepageInstagramPost> {
  List<Post> posts = [
    Post(
      images: ["images/i0.jpg", "images/i1.jpg", "images/i20.jpg"],
      username: "joshua_l",
      caption:
          "Craig_love and 44,686 others liked this. Sharing some moments from the game in Japan.",
      location: "Tokyo, Japan",
    ),
    // Add more posts here
  ];

  List<bool> isFavoritedList = [];
  List<bool> isBookmarkedList = [];
  List<List<String>> commentsList = [];
  List<bool> showLikeAnimation = [];
  List<int> carouselIndexList = [];

  @override
  void initState() {
    super.initState();
    isFavoritedList = List<bool>.filled(posts.length, false);
    isBookmarkedList = List<bool>.filled(posts.length, false);
    commentsList = List<List<String>>.generate(posts.length, (_) => []);
    showLikeAnimation = List<bool>.filled(posts.length, false);
    carouselIndexList = List<int>.filled(posts.length, 0);
  }

  void _toggleFavorite(int index) {
    setState(() {
      isFavoritedList[index] = !isFavoritedList[index];
      if (isFavoritedList[index]) {
        showLikeAnimation[index] = true;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            showLikeAnimation[index] = false;
          });
        });
      }
    });
  }

  void _toggleBookmark(int index) {
    setState(() {
      isBookmarkedList[index] = !isBookmarkedList[index];
    });
  }

  void _addComment(int index, String comment) {
    setState(() {
      commentsList[index].insert(0, comment);
    });
  }

  void _openChatScreen(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: ChatScreen(
            index: index,
            comments: commentsList[index],
            addComment: (comment) {
              _addComment(index, comment);
            },
          ),
        );
      },
    );
  }

  Widget postMap(Post postItem, int index) {
  return GestureDetector(
    onDoubleTap: () => _toggleFavorite(index),
    child: Container(
      width: double.infinity,
      height: 550,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(postItem.images![0]),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postItem.username!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(postItem.location!),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider(
                items: postItem.images!
                    .map((image) => ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            image,
                            width: 400,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (i, reason) {
                    setState(() {
                      carouselIndexList[index] = i;
                    });
                  },
                ),
              ),
              if (showLikeAnimation[index])
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 100,
                ),
            ],
          ),
          // Custom Indicator
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (dotIndex) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  width: dotIndex == carouselIndexList[index] ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: dotIndex == carouselIndexList[index]
                        ? Colors.blue // Use your desired color for the active dot
                        : Colors.grey[300], // Light shade for inactive dots
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      iconSize: 25,
                      icon: Icon(
                        isFavoritedList[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavoritedList[index]
                            ? Colors.red
                            : Theme.of(context).colorScheme.inversePrimary,
                      ),
                      onPressed: () => _toggleFavorite(index),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.chat_bubble_outline),
                      onPressed: () => _openChatScreen(index),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.send),
                  ],
                ),
                IconButton(
                  iconSize: 30,
                  icon: Icon(
                    isBookmarkedList[index]
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: () => _toggleBookmark(index),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postItem.caption!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        Post postItem = posts[index];
        return postMap(postItem, index);
      },
    );
  }
}

// Chat Screen widget remains the same

// Chat Screen widget remains the same

// Chat Screen
class ChatScreen extends StatefulWidget {
  final int index;
  final List<String> comments;
  final Function(String) addComment;

  const ChatScreen({
    Key? key,
    required this.index,
    required this.comments,
    required this.addComment,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _commentController = TextEditingController();
  bool _showEmojiPanel = false;
  List<String> emojis = [
    '😊',
    '❤️',
    '👍',
    '😂',
    '🎉',
    '😍',
    '😢',
    '😎',
    '🥳',
    '💔',
    '✨',
    '💯',
    '🙏',
    '😱',
    '💖',
    '🔥',
    '💃',
    '🐶',
    '🐱',
    '🌹',
    '🌈',
    '🍕',
    '🍔',
    '🥗',
    '🍦',
    '🍰',
    '🍉',
    '🌻',
    '🎈',
    '🎂',
    '🚀',
    '🏆',
    '🎤',
    '🕺',
    '🤗',
    '😇',
    '😈',
    '🥺',
    '🤩',
    '🥰',
    '🤓',
    '😷',
    '🤖',
    '👻',
    '💀',
    '☀️',
    '🌧️',
    '🌕',
    '🎃',
    '🦄'
  ];

  void _toggleEmojiPanel() {
    setState(() {
      _showEmojiPanel = !_showEmojiPanel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Column(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(
                            'images/i31.jpg'), // Update with your profile image path
                      ),
                      Text(
                        "G.B.M.R",
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  title: Text(widget.comments[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      widget.addComment(_commentController.text);
                      _commentController.clear();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.emoji_emotions),
                  onPressed: _toggleEmojiPanel,
                ),
              ],
            ),
          ),
          if (_showEmojiPanel)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: emojis.map((emoji) {
                  return GestureDetector(
                    onTap: () {
                      _commentController.text += emoji;
                    },
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

// Post class
class Post {
  String? username;
  String? caption;
  List<String>? images;
  String? location;

  Post({this.username, this.caption, this.images, this.location});
}
