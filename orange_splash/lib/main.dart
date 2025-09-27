import 'package:flutter/material.dart';
import 'package:orange_shared_pref/data_screen.dart';
import 'package:orange_shared_pref/splash_screen.dart';
import 'package:orange_shared_pref/tabs_screen.dart';
import 'package:orange_shared_pref/whatsapp.dart';

import 'drawer_screen.dart';
import 'grid_view_screen.dart';
import 'list_view_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Whatsapp() ,
    );
  }
}

// splash screen , Bottom Nav Bar, Tabs, Drawer