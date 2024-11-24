import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:project2024/pages/table.dart';
import 'package:project2024/pages/navbar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget circleWidget(double screenWidth){
    return Transform.rotate(
      angle: 40 * math.pi/180,
      child: Container(
        width: 0.2 * screenWidth,
        height: 0.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              begin: Alignment(-0.2, -0.8),
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 58, 204, 189),
                Color.fromARGB(214, 87, 226, 238)
              ],
            )
        ),
      ),
    );
  }
  
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
              Color.fromARGB(255, 58, 204, 189),
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

        drawer: Navbar(),

        appBar: AppBar(
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 15),
              icon: Icon(Icons.camera_alt, size: 35,),
              onPressed: (){},
            ),
          ],
          shape: Border(
            bottom: BorderSide(
              color: const Color.fromARGB(255, 183, 245, 237),
              
            ),
          ),
          
          backgroundColor: const Color.fromARGB(255, 183, 245, 237),
          elevation: 10,
          centerTitle: true,
          
          title: const Text(
            'HealthMitra',
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 9, 82, 113),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
        body: Stack(
            children: [

              Positioned(
                top: 650,
                right: -100,
                child: circleWidget(3*screenSize.width),
              ),
              Positioned(
                top: -60,
                left: -60,
                child: circleWidget(2*screenSize.width),
              ),
              Positioned(
                top: 120,
                left: -30,
                child: topWidget(screenSize.width), 
              ),

              Container(
                padding: const EdgeInsets.only(left: 35, top: 50),
                width: 500,
                height: 1000,
                child: const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Color.fromARGB(243, 11, 70, 93),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,  
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 35, top: 80),
                width: 500,
                height: 500,
                child: const Text(
                  'User'' !', //to put each individual users name here 
                  style: TextStyle(
                    color: Color.fromARGB(243, 11, 70, 93),
                    fontSize: 48,
                    fontWeight: FontWeight.bold,  
                  ),
                ),
              ),

              Positioned(
                  top: 0.25*screenSize.height,
                  left: 35,
                  right: 35,
                  
                    child: Container(
                      padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
                      width: 0.8*screenSize.width,
                      height: 400,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 183, 245, 237),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MyTable(),
                    ),
                  
                ),
                
                SizedBox(
                  height: 30,
                ),

                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 0.7*screenSize.height,
                      right: 35,
                      left: 35,
                    ),

                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 183, 245, 237),
                            filled: true,
                            hintText: 'Ask our Bot a Question',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
              



            ],
          ),
        ),
      );
  }
}