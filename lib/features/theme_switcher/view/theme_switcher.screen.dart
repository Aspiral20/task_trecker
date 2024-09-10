import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_trecker/storage/models/settings.model.dart';
import 'package:task_trecker/storage/models/theme.model.dart';

// todo update with new features:
// https://reliasoftware.com/blog/provider-in-flutter-for-state-management

class ThemeSwitcherScreen extends StatelessWidget {
  const ThemeSwitcherScreen({super.key});

  settingsActions( ) {
    return [
      Consumer<SettingsModel>(
        builder: (
            context,
            settingsModel,
            child,
            ) {
          return Icon(
            settingsModel.notificationsEnabled
                ? Icons.notifications
                : Icons.notifications_off_rounded,
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Center(
      child: SwitchListTile(
        title: const Text('Theme'),
        value: themeModel.isDark,
        onChanged: (value) {
          themeModel.toggleTheme();
        },
      ),
    );
  }
}
