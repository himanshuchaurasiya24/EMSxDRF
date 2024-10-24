import 'package:ems_frontend/reusables/contants_variables.dart';
import 'package:ems_frontend/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;
// String accessToken = '';
// String refreshToken = '';
void main() async {
  pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: backgroundColor),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 70,
            color: headingTextColor,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 35,
            color: headingTextColor,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: headingTextColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 23,
            color: headingTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: headingTextColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: backgroundColor,
          foregroundColor: headingTextColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
