import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../router/router.gr.dart';
// import 'package:flutter/foundation.dart';

@RoutePage()
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
        routes: const [
          HomeRoute(),
          SettingsRoute(),
          CalendarRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          debugPrint('$tabsRouter');
          return Scaffold(
            // appBar: AppBar(
            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            // title: Center(child: Text('Home')),
            // ),
            body: child,
            // drawer: Drawer(
            //     key: _drawerKey,
            //     child: ListView(
            //       padding: EdgeInsets.zero,
            //       children: [
            //         const DrawerHeader(
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //           ),
            //           child: Text('Dashboard'),
            //         ),
            //         ListTile(
            //           title: const Text('Home'),
            //           onTap: () {
            //             tabsRouter.setActiveIndex(0);
            //             Navigator.pop(context);
            //           },
            //         ),
            //         ListTile(
            //           title: const Text('Calendar'),
            //           onTap: () {
            //             tabsRouter.setActiveIndex(2);
            //             Navigator.pop(context);
            //           },
            //         ),
            //         ListTile(
            //           title: const Text('Settings'),
            //           onTap: () {
            //             tabsRouter.setActiveIndex(1);
            //             Navigator.pop(context);
            //           },
            //         ),
            //       ],
            //     )),
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
              items: bottomNavigationBarItems,
            ),
          );
        });
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
