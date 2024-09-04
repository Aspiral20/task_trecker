import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_trecker/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // return AutoTabsRouter(
    //     routes: const [
    //       // HomeRoute(),
    //       SettingsRoute(),
    //     ],
    //     builder: (context, child) {
    //       final tabsRouter = AutoTabsRouter.of(context);
    //       return Scaffold(
    //         // appBar: AppBar(
    //         //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //         //   title: Center(child: Text('Home')),
    //         // ),
    //         body: Container(),
    //         bottomNavigationBar: BottomNavigationBar(
    //           selectedItemColor: theme.primaryColor,
    //           unselectedItemColor: theme.hintColor,
    //           currentIndex: tabsRouter.activeIndex,
    //           onTap: (index) {
    //             _openPage(index, tabsRouter);
    //           },
    //           items: const [
    //             // BottomNavigationBarItem(
    //             //   icon: Icon(Icons.home),
    //             //   label: "Home",
    //             // ),
    //             BottomNavigationBarItem(
    //               icon: const Icon(Icons.search),
    //               label: "Search",
    //             ),
    //           ],
    //         ),
    //       );
    //     });

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      backgroundColor: theme.primaryColor,
      body: Container(),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
