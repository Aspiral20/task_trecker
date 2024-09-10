import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return Drawer(
        key: _drawerKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Dashboard'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                tabsRouter.setActiveIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Calendar'),
              onTap: () {
                tabsRouter.setActiveIndex(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                tabsRouter.setActiveIndex(1);
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
