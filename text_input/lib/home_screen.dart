import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String name;
  String password;
  String email;


   HomeScreen({required this.email,required this.password,required this.name,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text("Your Name is: $name"),
          Text("Your Email is: $email"),
          Text("Your Password is: $password"),

        ],
      ),
    );
  }
}
