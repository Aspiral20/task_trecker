import 'package:flutter/material.dart';
import 'package:task_trecker/router/router.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      title: 'TaskTrecker',
      routerConfig: appRouter.config(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.black54,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),

      // builder: (context, _) => Scaffold(
      //   appBar: AppBar(),
      //   body: Navigator(onGenerateRoute: routes),
      // ),
    );
  }
}
