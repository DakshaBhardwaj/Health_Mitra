import 'package:flutter/material.dart';// medicine_model.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class Medicine {
  final String name;
  final String frequency;

  Medicine({required this.name, required this.frequency});

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'] as String,
      frequency: json['frequency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'frequency': frequency,
    };
  }
}

// api_service.dart


class ApiService {
  final String baseUrl = 'YOUR_API_BASE_URL'; // Replace with your API URL

  Future<List<Medicine>> getMedicines() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/medicines'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Medicine.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load medicines');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> addMedicine(Medicine medicine) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/medicines'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(medicine.toJson()),
      );
      if (response.statusCode != 201) {
        throw Exception('Failed to add medicine');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

// medicine_table.dart


class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  final ApiService _apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _frequencyController = TextEditingController();
  
  List<Medicine> _medicines = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMedicines();
  }

  Future<void> _loadMedicines() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final medicines = await _apiService.getMedicines();
      setState(() {
        _medicines = medicines;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _addMedicine() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final medicine = Medicine(
        name: _nameController.text,
        frequency: _frequencyController.text,
      );
      await _apiService.addMedicine(medicine);
      _nameController.clear();
      _frequencyController.clear();
      await _loadMedicines();
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add Medicine Form
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Medicine Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter medicine name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _frequencyController,
                  decoration: const InputDecoration(labelText: 'Frequency'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter frequency';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isLoading ? null : _addMedicine,
                  child: const Text('Add Medicine'),
                ),
              ],
            ),
          ),
        ),

        // Error Message
        if (_error != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _error!,
              style: const TextStyle(color: Colors.red),
            ),
          ),

        // Loading Indicator
        if (_isLoading)
          const CircularProgressIndicator()
        else
          // Medicines Table
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(1.0),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                children: const [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Medicines',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(243, 11, 70, 93),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Frequency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(243, 11, 70, 93),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ..._medicines.map((medicine) => TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        medicine.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        medicine.frequency,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _frequencyController.dispose();
    super.dispose();
  }
}