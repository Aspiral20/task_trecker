import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../router/router.gr.dart';
// import 'package:flutter/foundation.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
        routes: const [
          HomeRoute(),
          SettingsRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            //   title: Center(child: Text('Home')),
            // ),
            body: child,
            drawer: Drawer(
                key: _drawerKey,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text('Drawer Header'),
                    ),
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        tabsRouter.setActiveIndex(0);
                      },
                    ),
                    ListTile(
                      title: const Text('Settings'),
                      onTap: () {
                        tabsRouter.setActiveIndex(1);
                      },
                    ),
                  ],
                )),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: theme.primaryColor,
              unselectedItemColor: theme.hintColor,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                _openPage(index, tabsRouter);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ],
            ),
          );
        });
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
