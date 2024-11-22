import 'package:flutter/material.dart';
import 'package:project2024/firebase_options.dart';
import 'package:project2024/pages/login.dart';
import 'package:project2024/pages/signuppage.dart';
import 'package:project2024/pages/homepage.dart';
import 'package:project2024/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const HealthMitra());
}

class HealthMitra extends StatelessWidget {
  const HealthMitra({super.key});

  @override
  Widget build(BuildContext context, ) {
    return MaterialApp(
      initialRoute: 'login',
      routes: {
        'login' : (context) => const LoginAuth(),
        'register' : (context) => const SignUp(),
        'mainpage' : (context) => const HomeScreen()
      },
      title: 'Health Mitra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBGColor,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: kPriColor,
        ),
      ),
      home: const LoginAuth(),
    );
  }
} 