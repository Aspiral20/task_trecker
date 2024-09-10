import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:task_trecker/features/theme_switcher/theme_switcher.dart';
import 'package:task_trecker/layouts/app_drawer/app_drawer.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
        ],
      ),
    );
  }
}
