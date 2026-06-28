import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../params/colors/colors.dart';

class HeaderHomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HeaderHomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  bool isHovered = false;

  void visitGitHubPage() async {
    final Uri url = Uri.parse('https://github.com/tiagotodescatto');
    if (!await launchUrl(url, mode: LaunchMode.platformDefault)) {
      throw Exception('Could not load URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.all(10),
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.isDarkMode
                  ? [darkColorBlack, mediumColorGrey]
                  : [mediumColorGrey, darkColorBlack],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                  alpha: widget.isDarkMode ? .4 : .6,
                ),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                onEnter: (_) => setState(() {
                  isHovered = true;
                }),
                onExit: (_) => setState(() {
                  isHovered = false;
                }),
                cursor: SystemMouseCursors.click,
                child: AnimatedScale(
                  scale: isHovered ? 1.2 : 1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  child: IconButton(
                    tooltip: 'Check out my GitHub page!',
                    onPressed: visitGitHubPage,
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: lightColorWhite,
                      shadows: [
                        isHovered
                            ? Shadow(
                                color: lightColorWhite.withValues(alpha: .7),
                                blurRadius: 5,
                                offset: const Offset(0, 2.5),
                              )
                            : Shadow(
                                color: lightColorWhite.withValues(alpha: .0),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Task Manager',
                style: TextStyle(
                  color: lightColorWhite,
                  fontSize: 30,
                  shadows: [
                    Shadow(
                      color: lightColorWhite.withValues(alpha: .5),
                      blurRadius: 5,
                      offset: const Offset(0, 2.5),
                    ),
                    Shadow(
                      color: lightColorWhite.withValues(alpha: .5),
                      blurRadius: 5,
                      offset: const Offset(0, -2.5),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.onThemeToggle, // Uses the parent callback
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 45,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.grey.shade300,
                      border: Border.all(
                        color: Colors.grey.shade800,
                        width: 2.5,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center, // Fixed typo
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // Fixed typo
                            children: [
                              Icon(
                                CupertinoIcons.moon,
                                color: darkColorPurple,
                                size: 27,
                              ),
                              const Icon(
                                CupertinoIcons.sun_max,
                                color: Colors.amber,
                                size: 27,
                              ),
                            ],
                          ),
                        ),
                        AnimatedAlign(
                          alignment: widget.isDarkMode
                              ? Alignment.centerLeft
                              : Alignment.centerRight, // Fixed typo
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                width: 1,
                                color: darkColorBlack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
