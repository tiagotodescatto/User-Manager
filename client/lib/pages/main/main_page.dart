import 'package:flutter/material.dart';

import '../../params/colors/colors.dart';
import './body.dart';
import 'header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;

  void toggleThemeMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      color: isDarkMode ? darkColorBlack : lightColorWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 90),
          child: HeaderHomePage(
            isDarkMode: isDarkMode,
            onThemeToggle: toggleThemeMode,
          ),
        ),
        body: BodyHomePage(isDarkMode: isDarkMode),
      ),
    );
  }
}
