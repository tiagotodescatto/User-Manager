import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../params/colors/colors.dart';

class BodyHomePage extends StatefulWidget {
  final bool isDarkMode;

  const BodyHomePage({super.key, required this.isDarkMode});

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  bool isHovered = false;

  void visitGitHubPage() async {
    final Uri url = Uri.parse('https://github.com/tiagotodescatto');
    if (!await launchUrl(url, mode: LaunchMode.platformDefault)) {
      throw Exception('Could not load URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            height: 500,
            width: 600,
            padding: const EdgeInsets.all(5),
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              color: widget.isDarkMode ? darkColorBlack : lightColorWhite,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: widget.isDarkMode ? lightColorWhite : darkColorBlack,
                width: .5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: widget.isDarkMode ? 0.7 : 0.2,
                  ),
                  blurRadius: 7.5,
                  spreadRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
