import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp(String username, String email, String password) async {
    final url = Uri.parse('https://f846-110-227-57-221.ngrok-free.app/register'); // Replace with your backend URL

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // User created successfully
      print('User  created: ${response.body}');
      _showDialog('Signup Successful', 'You have successfully signed up!');
      // Optionally navigate to the login page
    } else {
      // Handle error
      print('Failed to create user: ${response.body}');
      _showDialog('Signup Failed', 'User  already exists. Go back to login page.');
    }
  }


  void _showSnackBar(String title, String message) {
    final snackBar = SnackBar(
      content: Text('$title: $message'),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: 180 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.8, -0.8),
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 4, 207, 197),
              Color.fromARGB(210, 60, 213, 227)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            right: -30,
            child: topWidget(screenSize.width),
          ),
          Positioned(
            bottom: -220,
            left: -30,
            right: -30,
            child: topWidget(screenSize.width),
          ),
          Container(
            padding: const EdgeInsets.only(left: 125, top: 180),
            width: 500,
            height: 1000,
            child: const Text(
              'Create an\n Account',
              style: TextStyle(
                color: Color.fromARGB(243, 11, 70, 93),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.4,
                left: 35,
                right: 35,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 183, 245, 237),
                        filled: true,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 35),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 183, 245, 237),
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Check for '@' symbol
                        if (!value.contains('@')) {
                          // Show a dialog if '@' is missing
                          _showSnackBar('Invalid Email', 'Please enter a valid email address that contains an "@" symbol.');
                          return null; // Return null to indicate no validation error, since the dialog will inform the user
                        }
                        // Regular expression for validating email format
                        final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 35),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 183, 245, 237),
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                          
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 35),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signUp(nameController.text, emailController.text, passwordController.text);
                          
                        } else {
                          print('sign up failed');
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(243, 11, 70, 93),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(243, 11, 70, 93),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}