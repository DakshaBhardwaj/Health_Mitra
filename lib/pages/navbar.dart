import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: const Color.fromARGB(255, 183, 245, 237),
      child: ListView(
        padding: EdgeInsets.only(top: 40),
        children: [
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, 'profile');
            },
            leading: Icon(
              Icons.account_circle,
              size: 40,
              color: const Color.fromARGB(243, 9, 82, 113),
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 24,
                color: const Color.fromARGB(243, 9, 82, 113),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),
          
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, 'records');
            },
            leading: Icon(
              Icons.medical_information, 
              size: 40,
              color: const Color.fromARGB(243, 9, 82, 113),
            ),
            title: Text(
              'Med Records',
              style: TextStyle(
                fontSize: 24,
                color: const Color.fromARGB(243, 9, 82, 113),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          ListTile(
            onTap: (){
              Navigator.pushNamed(context, 'reminders');
            },
            leading: Icon(
              Icons.list_rounded, 
              size: 40,
              color: const Color.fromARGB(243, 9, 82, 113),
            ),
            title: Text(
              'Reminders',
              style: TextStyle(
                fontSize: 24,
                color: const Color.fromARGB(243, 9, 82, 113),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          ListTile(
            onTap: (){
              Navigator.pushNamed(context, 'login');
            },
            leading: Icon(
              Icons.logout, 
              size: 40,
              color: const Color.fromARGB(243, 9, 82, 113),
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 24,
                color: const Color.fromARGB(243, 9, 82, 113),
              ),
            ),
          ),
        ],
      ),
    );
  }
}