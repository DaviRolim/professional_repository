// TODO bottom bar for mobile
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigationBarSmall extends StatefulWidget {
  const NavigationBarSmall({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<NavigationBarSmall> createState() => _NavigationBarSmallState();
}

class _NavigationBarSmallState extends State<NavigationBarSmall> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.house),
          label: AppLocalizations.of(context)!.text__route_home,
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outlined),
          label: AppLocalizations.of(context)!.text__route_about,
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.rss_feed),
          label: AppLocalizations.of(context)!.text__route_posts,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          widget.pageController.jumpToPage(index);
        });
      },
    );
  }
}
