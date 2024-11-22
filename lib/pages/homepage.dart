import 'package:flutter/material.dart';
import 'dart:math' as math;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget topWidget(double screenWidth){
    return Transform.rotate(
      angle: -35 * math.pi/180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 96, 196, 226),
              Color.fromARGB(214, 87, 226, 238)
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;


    return SafeArea(
      minimum: EdgeInsets.all(5),
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),

          backgroundColor: const Color.fromARGB(255, 46, 200, 190),
          elevation: 50,
          centerTitle: true,
          
          title: const Text(
            '(●\'◡\'●)',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(243, 9, 82, 113),
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ),
        body: Column(

          children: [
            const SizedBox(
              height: 40,
            ),

            Container(
              padding: EdgeInsets.all(20),
              width: screenSize.width,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.red,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(20),      
              ),
            ),
          ],
        ),
      ),
    );
  }
}