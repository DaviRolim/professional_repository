import 'package:flutter/material.dart';

import 'social_icon_button.dart';


class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key, required this.isHorizontal}) : super(key: key);
  final bool isHorizontal;
  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SocialIconButton(
              assetPath: 'assets/images/github_icon.png',
              url: 'https://github.com/DaviRolim/'),
          SocialIconButton(
              assetPath: 'assets/images/linkedin_icon.png',
              url: 'https://www.linkedin.com/in/davi-rolim-9a489b11b/'),
        ],
      );
    } else {
      return Column(
        children: const [
          SocialIconButton(
              assetPath: 'assets/images/github_icon.png',
              url: 'https://github.com/DaviRolim/'),
          SocialIconButton(
              assetPath: 'assets/images/linkedin_icon.png',
              url: 'https://www.linkedin.com/in/davi-rolim-9a489b11b/'),
        ],
      );
    }
  }
}
