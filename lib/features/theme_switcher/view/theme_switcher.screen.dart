import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

// import 'package:task_trecker/features/icons/theme.icon.dart';
import 'package:task_trecker/storage/models/theme.model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// todo update with new features:
// https://reliasoftware.com/blog/provider-in-flutter-for-state-management

class ThemeSwitcherScreen extends StatelessWidget {
  const ThemeSwitcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    final localizations = AppLocalizations.of(context);

    return ListTile(
      title: Text("${localizations!.theme} (${themeModel.isDark ? "Dark" : "Light"})"),
      onTap: () {
        themeModel.toggleTheme();
      },
      trailing: Icon(
          themeModel.isDark ? LineAwesomeIcons.moon : LineAwesomeIcons.sun),
    );
  }
}
