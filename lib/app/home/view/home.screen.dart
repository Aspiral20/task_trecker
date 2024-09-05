import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

// import 'package:task_trecker/features/bottom_app_bar/bottom_app_bar.dart';
// import 'package:task_trecker/features/bottom_app_bar/view/bottom_app_bar.screen.dart';

List<Map<dynamic, dynamic>> listTabs = [
  {
    'title': 'Cloud',
    'icon': Icons.cloud_outlined,
    'data': [
      {
        'title': 'First Item',
      },
      {
        'title': '2nd Item',
      },
    ]
  },
  {
    'title': 'Beach',
    'icon': Icons.beach_access_sharp,
    'data': [
      {
        'title': '1st Item',
      },
    ]
  },
  {
    'title': 'Sunny',
    'icon': Icons.brightness_5_sharp,
    'data': [
      {
        'title': 'First Item',
      },
    ]
  },
];

final List<Map> notFoundData = [
  {'title': 'Not found data'}
];

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

    return DefaultTabController(
        initialIndex: 1,
        length: listTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            bottom: TabBar(
              tabs: <Widget>[
                for (var listTab in listTabs)
                  Tab(
                    icon: Icon(listTab['icon']),
                    text: listTab['title'] ?? 'No Title',
                  )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              for (var listTab in listTabs)
                ListView(
                  children: [
                    for (var tabDataEl in listTab['data'] ?? notFoundData)
                      ListTile(
                        title: Text(tabDataEl['title']),
                      )
                  ],
                ),
            ],
          ),
        ));
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
