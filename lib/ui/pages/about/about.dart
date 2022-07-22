import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/animation_slider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimationSlider(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.text__about,
                  style: Theme.of(context).textTheme.displaySmall!),
              const SizedBox(height: 35),
              Container(
                margin: EdgeInsets.only(
                    right: size.width > 1240
                        ? size.width * 0.25
                        : size.width > 550
                            ? size.width * 0.05
                            : 0),
                child: Text(AppLocalizations.of(context)!.text__about_me,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
