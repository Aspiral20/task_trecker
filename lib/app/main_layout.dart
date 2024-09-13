import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_trecker/router/router.gr.dart';
// import 'package:flutter/foundation.dart';

@RoutePage()
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Map<String, dynamic>> bottomNavigationBarItems = [
    {'icon': Icons.home, 'label': "Home", 'route': const HomeRoute()},
    {
      'icon': Icons.account_circle_rounded,
      'label': "Profile",
      'route': const ProfileRoute()
    },
    {
      'icon': Icons.calendar_month,
      'label': "Calendar",
      'route': const CalendarRoute()
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomNavBarRoutes =
        bottomNavigationBarItems.map((botNavBarEl) => botNavBarEl['route']);
    return AutoTabsRouter(
        routes: [
          ...bottomNavBarRoutes,
          const FaqRoute(),
          const SettingsRoute(),
          const EditRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor:
                  tabsRouter.activeIndex >= bottomNavigationBarItems.length
                      ? theme.hintColor
                      : theme.secondaryHeaderColor,
              unselectedItemColor: theme.hintColor,
              currentIndex:
                  tabsRouter.activeIndex >= bottomNavigationBarItems.length
                      ? 0
                      : tabsRouter.activeIndex,
              onTap: (index) {
                _openPage(index, tabsRouter);
              },
              items: [
                for (var bottomNavigationBarItem in bottomNavigationBarItems)
                  BottomNavigationBarItem(
                    icon: Icon(bottomNavigationBarItem['icon']),
                    label: bottomNavigationBarItem['label'],
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
