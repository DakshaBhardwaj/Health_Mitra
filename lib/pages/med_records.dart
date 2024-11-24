import 'package:flutter/material.dart';

class MedRecords extends StatefulWidget {
  const MedRecords({super.key});

  @override
  State<MedRecords> createState() => _MedRecordsState();
}

class _MedRecordsState extends State<MedRecords> {
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