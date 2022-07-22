import 'package:flutter/material.dart';

import 'shared/social_icons.dart';


class NavigationBarMedium extends StatefulWidget {
  const NavigationBarMedium({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  State<NavigationBarMedium> createState() => _NavigationBarMediumState();
}

class _NavigationBarMediumState extends State<NavigationBarMedium> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NavigationRail(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      selectedIndex: _selectedIndex,
      leading: Container(
        margin: const EdgeInsets.only(bottom: 30, top: 20),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          backgroundImage: const AssetImage('assets/images/self_avatar.png'),
          maxRadius: 25,
        ),
      ),
      selectedIconTheme: Theme.of(context)
          .iconTheme
          .copyWith(color: Theme.of(context).colorScheme.primary),
      trailing: Container(
          margin: EdgeInsets.only(top: size.height * 0.25),
          child: const SocialIcons(isHorizontal: false)),
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
          widget.pageController.jumpToPage(index);
        });
      },
      groupAlignment: -0.9,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.house_outlined),
          selectedIcon: Icon(Icons.house),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outlined),
          selectedIcon: Icon(Icons.person),
          label: Text('About'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.rss_feed),
          selectedIcon: Icon(Icons.rss_feed),
          label: Text('Posts'),
        ),
      ],
    );
  }
}
