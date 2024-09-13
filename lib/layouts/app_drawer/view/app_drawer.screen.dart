import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_trecker/features/section_divider/section_divider.dart';
import 'package:task_trecker/router/router.gr.dart';
import 'package:task_trecker/storage/models/theme.model.dart';

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
    final theme = Theme.of(context);

    return Drawer(
        key: _drawerKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: theme.primaryColor,
              ),
              child: const Text('Dashboard'),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(LineAwesomeIcons.home_solid),
              onTap: () {
                context.navigateTo(HomeRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(LineAwesomeIcons.user),
              onTap: () {
                context.navigateTo(ProfileRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Calendar'),
              leading: const Icon(LineAwesomeIcons.calendar),
              onTap: () {
                context.navigateTo(CalendarRoute());
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   title: const Text('Rate Us'),
            //   leading: const Icon(
            //     Icons.star,
            //     color: Colors.deepOrange,
            //   ),
            //   onTap: () {
            //     tabsRouter.setActiveIndex(3);
            //     Navigator.pop(context);
            //   },
            // ),
            SectionDivider(title: 'Info'),
            // ListTile(
            //   title: const Text('About Us'),
            //   leading: const Icon(LineAwesomeIcons.sitemap_solid),
            //   onTap: () {
            //     tabsRouter.setActiveIndex(3);
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              title: const Text('Faq'),
              leading: const Icon(Icons.question_mark),
              onTap: () {
                context.navigateTo(FaqRoute());
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   title: const Text('Feedback'),
            //   leading: const Icon(LineAwesomeIcons.edit),
            //   onTap: () {
            //     tabsRouter.setActiveIndex(3);
            //     Navigator.pop(context);
            //   },
            // ),
            SectionDivider(title: 'Manage'),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(LineAwesomeIcons.cog_solid),
              onTap: () {
                context.navigateTo(SettingsRoute());
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
