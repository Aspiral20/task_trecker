import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_trecker/features/section_divider/section_divider.dart';
import 'package:task_trecker/features/theme_switcher/theme_switcher.dart';
import 'package:task_trecker/layouts/app_drawer/app_drawer.dart';
import 'package:task_trecker/layouts/language_changer/view/language_changer.screen.dart';
import 'package:task_trecker/storage/models/settings.model.dart';
import 'package:task_trecker/storage/models/theme.model.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  settingsActions() {
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
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const AppDrawer(),
        backgroundColor: theme.primaryColor,
        body: const Column(
          children: [
            ThemeSwitcherScreen(),
            // SectionDivider(title: 'Date & Time'),
            // SectionDivider(title: 'Language'),
            LanguageChangerScreen()
          ],
        ));
  }
}
