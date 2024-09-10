import 'package:flutter/material.dart';
import 'package:task_trecker/providers/app_colors.provider.dart';

class ThemeModel with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get currentTheme => _isDark
      ? ThemeData.dark()
      : ThemeData(
          primaryColor: AppColors['mainColor'],
          secondaryHeaderColor: AppColors['secondaryColor'],
          focusColor: AppColors['mainColor'],
          textTheme: const TextTheme(),
          // hintColor: Colors.black54,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          tabBarTheme: TabBarTheme(
            labelColor: AppColors['secondaryColor'],
            dividerColor: AppColors['secondaryColor'],
            indicatorColor: AppColors['secondaryColor'],
            unselectedLabelColor: AppColors['unselectedColor'],
          ));

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
