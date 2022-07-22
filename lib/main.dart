import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/app.dart';
import 'ui/pages/posts/components/post_detail.dart';
import 'ui/providers/theme.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = ValueNotifier(ThemeSettings(
      sourceColor: Colors.grey,
      themeMode: ThemeMode.system,
    ));
    return ThemeProvider(
      lightDynamic: ColorScheme.fromSeed(seedColor: Colors.grey),
      darkDynamic: const ColorScheme.dark(),
      settings: settings,
      child: NotificationListener<ThemeSettingChange>(
        onNotification: (notification) {
          settings.value = notification.settings;
          return true;
        },
        child: ValueListenableBuilder<ThemeSettings>(
            valueListenable: settings,
            builder: (context, value, _) {
              final theme = ThemeProvider.of(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Davi Holanda',
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('pt', 'BR'),
                ],
                theme: theme.light(settings.value.sourceColor),
                themeMode: theme.themeMode(),
                darkTheme: theme.dark(settings.value.sourceColor),
                home: App(),
                // routes: {
                //   // PostDetail.routeName: (ctx) => PostDetail(tag: 'a'),
                //   // MainScreen.routeName: (ctx) => MainScreen(),
                // },
              );
            }),
      ),
    );
  }
}
