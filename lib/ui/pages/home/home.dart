import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/animation_slider.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final nameStyleLarge = Theme.of(context).textTheme.displayLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface);
    final nameStyleSmall = Theme.of(context).textTheme.displayMedium!.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface);

    final descriptionLarge = GoogleFonts.inconsolata(
        textStyle: Theme.of(context).textTheme.headlineMedium!);
    final descriptionSmall = GoogleFonts.inconsolata(
        textStyle: Theme.of(context).textTheme.headlineSmall!);
    return AnimationSlider(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.text__home_hi,
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantSc(
                textStyle: size.width >= 960 ? nameStyleLarge : nameStyleSmall,
              ),
            ),
            const SizedBox(height: 80),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Text(
                AppLocalizations.of(context)!.text__home_description,
                textAlign: TextAlign.center,
                style: size.width >= 960 ? descriptionLarge : descriptionSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
