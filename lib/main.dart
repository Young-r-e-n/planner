// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Flutter To-Do App',
        theme: ThemeData(
          primaryColor: Colors.blue.shade600,
          fontFamily: 'Roboto',
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue.shade600,
            elevation: 0,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue.shade600,
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue.shade600,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber.shade600),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
