import 'package:flutter/material.dart';
import 'package:orange_shared_pref/setting_screen.dart';
import 'home_screen.dart';
import 'more_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: currentScreen,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Container(color: Colors.black,)),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              subtitle: Text("Home Screen"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  currentScreen = HomeScreen();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              subtitle: Text("Settings Screen"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  currentScreen = SettingScreen();
                });

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.more),
              title: Text("More"),
              subtitle: Text("More Screen"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  currentScreen = MoreScreen();
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}
