import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/navigation/main_layout.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/resume.dart';
import 'package:portfolio/theme/my_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.green);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.green, brightness: Brightness.dark);
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Johnny's Portfolio",
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: MyTheme.lightColorScheme,
          textTheme: MyTheme.textTheme),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: MyTheme.darkColorScheme,
          textTheme: MyTheme.textTheme),
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
