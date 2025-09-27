import 'package:flutter/material.dart';

class Whatsapp extends StatefulWidget {
  const Whatsapp({super.key});

  @override
  State<Whatsapp> createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ChatsScreen(),
    const Center(child: Text("Updates Screen")),
    const Center(child: Text("Communities Screen")),
    const Center(child: Text("Calls Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            color: Color(0xFF25D366),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.camera_alt_outlined, color: Colors.black87),
          SizedBox(width: 16),
          Icon(Icons.more_vert, color: Colors.black87),
          SizedBox(width: 8),
        ],
      ),

      body: _screens[_currentIndex],

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF25D366),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "Updates",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: "Communities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Calls",
          ),
        ],
      ),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Ask Meta AI or Search",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // Tabs
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildChip("All", true),
              _buildChip("Unread", false),
              _buildChip("Favourites", false),
              _buildChip("Groups", false),
              _buildChip("+", false),
            ],
          ),
        ),

        const Divider(),

        Expanded(
          child: ListView(
            children: const [
              ChatTile(
                name: "Chelsea FC.",
                message: "Are you ready to the match !?",
                date: "9/22/25",
                avatar: "assets/images/chelsea.png",
              ),
              ChatTile(
                name: "Maserati",
                message: "Hey!! check this car",
                date: "9/17/25",
                avatar: "assets/images/maserati.png",
              ),
              ChatTile(
                name: "Elon Musk",
                message: "What's up today?",
                date: "9/14/25",
                avatar: "assets/images/elon.webp",
              ),
              ChatTile(
                name: "Cristiano Ronaldo",
                message: "Wanna join us today?",
                date: "9/10/19",
                avatar: "assets/images/ronaldo.webp",
              ),
              ChatTile(
                name: "Manchester United",
                message: "Glory Glory Man united!!",
                date: "9/10/19",
                avatar: "assets/images/manutd.png",
              ),
              ChatTile(
                name: "Volkswagen",
                message: "Best Luck Mr.Amer",
                date: "9/8/19",
                avatar: "assets/images/volkswagen.png",
              ),
              ChatTile(
                name: "Kylian Mbappe",
                message: "What a great match!! Big 7",
                date: "9/1/25",
                avatar: "assets/images/mbappe.jpg",
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildChip(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        selectedColor: Colors.grey.shade300,
        onSelected: (_) {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

}

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String date;
  final String avatar;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.date,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(avatar),
        radius: 24,
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      trailing: Text(date, style: const TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }
}
