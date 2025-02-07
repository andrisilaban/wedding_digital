// main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/rsvp_provider.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RsvpProvider()),
      ],
      child: const WeddingApp(),
    ),
  );
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Invitation',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.playfairDisplayTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}
