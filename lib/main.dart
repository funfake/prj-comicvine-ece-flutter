import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comicvine/src/presentation/widgets/GeneralLayout.dart';
import 'package:comicvine/src/presentation/pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComicVine',
      theme: ThemeData(
        colorScheme: ColorScheme(
          background: Color(0xFF15232E),
          onBackground: Colors.white,
          primary: Color(0xFFFF8100),
          secondary: Color(0xFF778BA8),
          surface: Color(0xFF15232E),
          onSurface: Colors.white, // set default text color
          onPrimary: Color(0xFF12273C),
          onSecondary: Color(0xFF778BA8),
          error: Colors.red,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
        useMaterial3: true,
      ),
      home: GeneralLayout(
        content: const HomePage(title: 'Bienvenue !'),
      ),
    );
  }
}