import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:task_trecker/router/router.gr.dart';

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
    // return AutoTabsRouter(
    //     routes: const [
    //       HomeRoute(),
    //       SettingsRoute(),
    //     ],
    //     builder: (context, child) {
    //       return Scaffold(
    //         appBar: AppBar(
    //           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //           title: Center(child: Text('Settings')),
    //         ),
    //         bottomNavigationBar: BottomNavigationBar(
    //           items: const [
    //             BottomNavigationBarItem(
    //               icon: Icon(Icons.home),
    //               label: "Home",
    //             ),
    //             BottomNavigationBarItem(
    //               icon: Icon(Icons.search),
    //               label: "Search",
    //             ),
    //           ],
    //         ),
    //       );
    //     });

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      backgroundColor: theme.primaryColor,
      body: Container(),
    );
  }
}
