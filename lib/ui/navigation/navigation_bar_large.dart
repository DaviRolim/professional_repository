import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'shared/social_icons.dart';

class NavigationBarLarge extends StatefulWidget {
  final PageController pageController;
  const NavigationBarLarge({Key? key, required this.pageController}) : super(key: key);

  @override
  State<NavigationBarLarge> createState() => _NavigationBarLargeState();
}

class _NavigationBarLargeState extends State<NavigationBarLarge> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      width: size.width * 0.20,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            backgroundImage: const AssetImage('assets/images/self_avatar.png'),
            maxRadius: 50,
          ),
          const SizedBox(height: 20),
          if (size.width >= 1140)
            Column(
              children: [
                Text('Davi Holanda',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.text__home_job_title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!),
              ],
            ),
          const SizedBox(height: 45),
          Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: NavigationItem(
                index: 0,
                selected: _selectedIndex == 0,
                routeName: AppLocalizations.of(context)!.text__route_home,
                onPressed: _onPressed),
          ),
          const SizedBox(height: 10),
          NavigationItem(
              index: 1,
              selected: _selectedIndex == 1,
              routeName: AppLocalizations.of(context)!.text__route_about,
              onPressed: _onPressed),
          const SizedBox(height: 10),
          NavigationItem(
              index: 2,
              selected: _selectedIndex == 2,
              routeName: AppLocalizations.of(context)!.text__route_posts,
              onPressed: _onPressed),
          const SizedBox(height: 10),
          const Spacer(),
          const Align(
            alignment: Alignment.bottomCenter,
            child: SocialIcons(isHorizontal: true),
          ),
        ],
      ),
    );
  }

  _onPressed(pageIndex) {
    widget.pageController.jumpToPage(pageIndex);
    setState(() {
      _selectedIndex = pageIndex;
    });
    // animateToPage(pageIndex,
    // duration: const Duration(milliseconds: 400), curve: Curves.linear);
  }
}
// TODO transform this in a _build method instead of a separated class
class NavigationItem extends StatelessWidget {
  final int index;
  final String routeName;
  final Function onPressed;
  final bool selected;
  const NavigationItem(
      {Key? key,
      required this.index,
      required this.routeName,
      required this.onPressed,
      required this.selected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.12,
      height: 30,
      child: ElevatedButton(
        style: selected
            ? ElevatedButton.styleFrom(
                side: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.primary))
            : null,
        onPressed: () => onPressed(index),
        child: Center(
          child: Text(
            routeName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
