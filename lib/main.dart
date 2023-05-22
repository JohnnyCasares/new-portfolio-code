import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/navigation/main_layout.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/resume.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Johnny's Portfolio",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        // accentColor: Colors.green,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.ubuntu(fontSize: 57, letterSpacing: 0),
          displayMedium: GoogleFonts.ubuntu(fontSize: 45, letterSpacing: 0),
          displaySmall: GoogleFonts.ubuntu(fontSize: 36, letterSpacing: 0),
          headlineLarge: GoogleFonts.ubuntu(fontSize: 32, letterSpacing: 0),
          headlineMedium: GoogleFonts.ubuntu(fontSize: 28, letterSpacing: 0),
          headlineSmall: GoogleFonts.ubuntu(fontSize: 24, letterSpacing: 0),
          titleLarge: GoogleFonts.ubuntu(fontSize: 22, letterSpacing: 0),
          titleMedium: GoogleFonts.ubuntu(fontSize: 16, letterSpacing: 0.15),
          titleSmall:
              GoogleFonts.sourceCodePro(fontSize: 14, letterSpacing: 0.1),
          bodyLarge:
              GoogleFonts.sourceCodePro(fontSize: 16, letterSpacing: 0.15),
          bodySmall:
              GoogleFonts.sourceCodePro(fontSize: 12, letterSpacing: 0.4),
        ),
      ),
      home: const MyHomePage(title: "Johnny Casares"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  int _selectedIndex = 0;
  List<Widget> pages = [HomePage(), ResumePage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: widget.title,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        labelType: labelType,
        body: IndexedStack(
          alignment: Alignment.bottomCenter,
          index: _selectedIndex,
          children: pages,
        ));
  }
}
