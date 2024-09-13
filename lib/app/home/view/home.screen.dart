import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:task_trecker/layouts/app_drawer/app_drawer.dart';
import 'package:task_trecker/utils/finals/not_found.dart';
import '../data/list_tabs.data.dart';

// import 'package:task_trecker/features/bottom_app_bar/bottom_app_bar.dart';
// import 'package:task_trecker/features/bottom_app_bar/view/bottom_app_bar.screen.dart';

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

    return DefaultTabController(
        initialIndex: 1,
        length: listTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tasks'),
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
          drawer: const AppDrawer(),
          body: TabBarView(
            children: <Widget>[
              for (var listTab in listTabs)
                ListView(
                  children: [
                    for (var tabDataEl in listTab['data'] ?? listOneNotFoundData)
                      ListTile(
                        title: Text(tabDataEl['title']),
                        leading: Icon(tabDataEl['icon']),
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
