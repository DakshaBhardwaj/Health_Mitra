import 'package:flutter/material.dart';
import 'dart:math' as math;
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget topWidget(double screenWidth){
    return Transform.rotate(
      angle: 180* math.pi/180,
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
                right: 35
                ),
              child: Column(
                children: [

                  TextField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 183, 245, 237),
                      filled: true,
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 35,
                  ),

                  TextField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 183, 245, 237),
                      filled: true,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  
                  const SizedBox(
                    height: 35,
                  ),
                  
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 183, 245, 237),
                      filled: true,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Container(
                        padding: const EdgeInsets.only(left: 85),
                         child: TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'login');
                          },
                            child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Color.fromARGB(243, 11, 70, 93),
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                      Container(
                        padding: const EdgeInsets.only(right: 80),
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(243, 11, 70, 93),
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.arrow_forward, color: Colors.white,),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 80,
                  ),
                  
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'login');
                    },
                    child: const Text(
                      'Back to Login Page',
                      style: TextStyle(
                        color: Color.fromARGB(243, 11, 70, 93),
                        fontSize: 20,
                        decoration: TextDecoration.underline,     
                      ),
                    ),
                  ),      
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
