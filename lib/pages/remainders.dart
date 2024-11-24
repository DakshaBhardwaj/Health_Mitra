import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add leading back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // AppBar styling
        title: const Text('Page Title'),
        backgroundColor: Colors.blue, // Change color as needed
        elevation: 2, // Add shadow under the AppBar
        centerTitle: true, // Center the title
      ),
      body: const Center(
        child: Text('Page Content'),
      ),
    );
  }
}