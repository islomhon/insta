import 'package:flutter/material.dart';



class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Notifications')),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Following'),
            Tab(text: 'You'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NotificationTabView(), // Following tab content
          NotificationTabView(), // You tab content
        ],
      ),
    );
  }
}

class NotificationTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SectionHeader(title: 'Today'),
        NotificationItem(
          imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
          title: 'karenne liked your photo.',
          timeAgo: '1h',
          actionButton: null,
        ),
        SectionHeader(title: 'This Week'),
        NotificationItem(
          imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
          title: 'kiero_d, zackjohn and 26 others liked your photo.',
          timeAgo: '3h',
          actionButton: null,
        ),
        NotificationItem(
          imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
          title: 'craig_love mentioned you in a comment.',
          timeAgo: '2d',
          actionButton: ElevatedButton(
            onPressed: () {},
            child: Text('Reply'),
          ),
        ),
        NotificationItem(
          imageUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
          title: 'martini_rond started following you.',
          timeAgo: '3d',
          actionButton: ElevatedButton(
            onPressed: () {},
            child: Text('Message'),
          ),
        ),
        NotificationItem(
          imageUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
          title: 'maxjacobson started following you.',
          timeAgo: '3d',
          actionButton: ElevatedButton(
            onPressed: () {},
            child: Text('Message'),
          ),
        ),
        NotificationItem(
          imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
          title: 'mis_potter started following you.',
          timeAgo: '3d',
          actionButton: ElevatedButton(
            onPressed: () {},
            child: Text('Follow'),
          ),
        ),
        SectionHeader(title: 'This Month'),
        NotificationItem(
          imageUrl: 'https://randomuser.me/api/portraits/women/6.jpg',
          title: 'randomuser started following you.',
          timeAgo: '1w',
          actionButton: null,
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String timeAgo;
  final Widget? actionButton;

  NotificationItem({
    required this.imageUrl,
    required this.title,
    required this.timeAgo,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: title, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' $timeAgo'),
          ],
        ),
      ),
      trailing: actionButton ?? SizedBox.shrink(),
    );
  }
}
