import 'package:flutter/material.dart';
import 'models/habit.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const HabitStreakifyApp());
}

class HabitStreakifyApp extends StatelessWidget {
  const HabitStreakifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Streakify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000),
        cardColor: const Color(0xFF212121),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF9600),
          secondary: const Color(0xFFFFD60A),
          surface: const Color(0xFF212121),
          background: const Color(0xFF000000),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Color(0xFFFBFAF5),
          ),
          displayMedium: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFFFBFAF5),
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Color(0xFFFBFAF5),
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Color(0xFFFBFAF5),
          ),
        ),
        fontFamily: 'Inter',
      ),
      home: const HomeScreen(),
    );
  }
}
