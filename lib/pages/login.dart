import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoginAuth extends StatefulWidget {
  const LoginAuth({super.key});

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
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
              Color.fromARGB(214, 87, 226, 238),
            ],
          ),
        ),
      ),
    );
  }
  Widget bottomWidget(double screenWidth){
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment(0.6, -1.1),
          end: Alignment(0.7, 0.8),
          colors: [
            Color.fromARGB(214, 87, 226, 238),
            Color.fromARGB(235, 0, 255, 204)
          ],
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
            child: topWidget(screenSize.width), 
          ),

          Positioned(
            bottom: -200,
            left: -80,
            child: bottomWidget(screenSize.width),
          ),

          Container(
            padding: const EdgeInsets.only(left: 35, top: 140),
            width: 500,
            height: 1000,
            child: const Text(
              'Welcome To',
              style: TextStyle(
                color: Color.fromARGB(243, 11, 70, 93),
                fontSize: 36,
                fontWeight: FontWeight.bold,  
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 35, top: 180),
            width: 500,
            height: 1000,
            child: const Text(
              'Health Mitra',
              style: TextStyle(
                color: Color.fromARGB(243, 11, 70, 93),
                fontSize: 54,
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
                            Navigator.pushNamed(context, 'mainpage');
                          },
                            child: const Text(
                            'Sign in',
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
                    height: 120,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(243, 11, 70, 93),
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(243, 11, 70, 93),
                          ),
                        ),
                      ),

                    ],
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