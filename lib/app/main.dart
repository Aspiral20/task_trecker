import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_trecker/router/router.dart';
import 'package:task_trecker/storage/models/theme.model.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeModel(),
        child: const App(),
      ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return Consumer<ThemeModel>(
      builder: (
          context,
          themeModel,
          child,
          ) {
        return MaterialApp.router(
          title: 'TaskTrecker',
          routerConfig: appRouter.config(),
          theme: themeModel.currentTheme
        );
      },
    );
  }
}
