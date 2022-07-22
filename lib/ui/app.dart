import 'package:flutter/material.dart';
import 'package:professional_repository/ui/pages/about/about.dart';

import 'navigation/navigation_bar_small.dart';
import 'navigation/navigation_bar_large.dart';
import 'navigation/navigation_bar_medium.dart';
import 'pages/home/home.dart';
import 'pages/posts/posts.dart';
import 'pages/shared/brightness_toggle.dart';

class App extends StatelessWidget {
  App({super.key});

  final pageController = PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: size.width < 550
          ? NavigationBarSmall(pageController: pageController)
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (size.width >= 960)
              NavigationBarLarge(pageController: pageController),
            if (size.width < 960 && size.width >= 550)
              NavigationBarMedium(pageController: pageController),
            Expanded(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: BrightnessToggle()),
                      ),
                      Flexible(
                        child: PageView(
                          controller: pageController,
                          children: List.unmodifiable(
                            [
                              const HomePage(),
                              const AboutPage(),
                              const PostPage(),
                            ],
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
    );
  }
}
