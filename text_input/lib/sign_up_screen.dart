import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool showErrorEmail = false;
  bool obscureText1 = true;
  bool obscureText2 = true;

  bool isEmail({required String em}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Sign Up Page" , style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    errorText: showErrorEmail ? "Invalid email" : null,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Name"),
                    suffixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: obscureText1,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureText1 = !obscureText1;
                        setState(() {});
                      },
                      icon: Icon(obscureText1 ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: obscureText2,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text("Confirm Password"),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureText2 = !obscureText2;
                        setState(() {});
                      },
                      icon: Icon(obscureText2 ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 40), // قللنا المسافة بدل 100 لتناسب scroll
                TextButton(
                  onPressed: () {
                    showErrorEmail = !isEmail(em: emailController.text);
                    setState(() {});

                    if (!showErrorEmail &&
                        passwordController.text.isNotEmpty &&
                        passwordController.text == confirmPasswordController.text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.grey,
                          content: Text("Make sure your password is correct 😅"),
                          duration: Duration(seconds: 4),
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
