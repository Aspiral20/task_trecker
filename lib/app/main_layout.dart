import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:task_trecker/router/router.gr.dart';

// import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Map<String, dynamic>> bottomNavigationBarItems = [
    {
      'icon': LineAwesomeIcons.home_solid,
      'label': (AppLocalizations? localizations) => localizations!.routes_home,
      'route': const HomeRoute()
    },
    {
      'icon': LineAwesomeIcons.user,
      'label': (AppLocalizations? localizations) =>
          localizations!.routes_profile,
      'route': const ProfileRoute()
    },
    {
      'icon': LineAwesomeIcons.calendar,
      'label': (AppLocalizations? localizations) =>
          localizations!.routes_calendar,
      'route': const CalendarRoute()
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
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
                    label: bottomNavigationBarItem['label'](localizations),
                  ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.home),
                //   label: "${localizations != null ? localizations[bottomNavigationBarItems[0]['labelKey']] : bottomNavigationBarItems[0]['label']}",
                // ),
                //   BottomNavigationBarItem(
                //     icon: Icon(Icons.account_circle_rounded),
                //     label: "${localizations != null ? localizations[bottomNavigationBarItems[1]['labelKey']] : bottomNavigationBarItems[1]['label']}",
                //   ),
                //   BottomNavigationBarItem(
                //     icon: Icon(Icons.calendar_month),
                //     label: "${localizations != null ? localizations[bottomNavigationBarItems[2]['labelKey']] : bottomNavigationBarItems[2]['label']}",
                //   ),
              ],
            ),
          );
        });
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
