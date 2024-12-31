import 'package:flutter/material.dart';
import 'package:flutter_application_1/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Aplication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Background putih
        cardColor: Colors.white, // Warna Card putih
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStatePropertyAll(Colors.blue), // Warna Checkbox
          checkColor: WidgetStatePropertyAll(Colors.white), // Warna centang
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.black38,
          selectionHandleColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
