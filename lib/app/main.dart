import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_trecker/l10n/l10n.dart';
import 'package:task_trecker/router/router.dart';
import 'package:task_trecker/storage/models/language.model.dart';
import 'package:task_trecker/storage/models/theme.model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeModel>(
      create: (context) => ThemeModel(),
    ),
    ChangeNotifierProvider<LanguageModel>(
      create: (context) => LanguageModel(),
    ),
  ], child: const App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return Consumer2<ThemeModel, LanguageModel>(
      builder: (
        context,
        themeModel,
        languageModel,
        child,
      ) {
        return MaterialApp.router(
          title: 'TaskTrecker',
          routerConfig: appRouter.config(),
          theme: themeModel.currentTheme,
          locale: languageModel.locale,
          supportedLocales: localeLangs,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        );
      },
    );
  }
}
