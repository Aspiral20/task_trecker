import 'package:flutter/material.dart';
import 'package:task_trecker/utils/finals/global/colors.dart';

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
            dividerColor: Colors.transparent,
            indicatorColor: AppColors['secondaryColor'],
            unselectedLabelColor: AppColors['unselectedColor'],
          ),
          elevatedButtonTheme:ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors['secondaryColor'],
              )));

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
