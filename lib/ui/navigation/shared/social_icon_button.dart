import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({Key? key, required this.assetPath, required this.url})
      : super(key: key);

  final String url;
  final String assetPath;

  void _launchUrl() async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: IconButton(
        onPressed: () => _launchUrl(),
        icon: Image.asset(
          assetPath,
          fit: BoxFit.fill,
          height: 60,
        ),
      ),
    );
  }
}
