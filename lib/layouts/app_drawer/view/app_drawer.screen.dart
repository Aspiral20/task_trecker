import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:task_trecker/features/section_divider/section_divider.dart';
import 'package:task_trecker/router/router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final tabsRouter = AutoTabsRouter.of(context);
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    return Drawer(
        key: _drawerKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: theme.primaryColor,
              ),
              child: Text(localizations!.dashboard),
            ),
            ListTile(
              title: Text(localizations.routes_home),
              leading: const Icon(LineAwesomeIcons.home_solid),
              onTap: () {
                context.navigateTo(const HomeRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(localizations.routes_profile),
              leading: const Icon(LineAwesomeIcons.user),
              onTap: () {
                context.navigateTo(const ProfileRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(localizations.routes_calendar),
              leading: const Icon(LineAwesomeIcons.calendar),
              onTap: () {
                context.navigateTo(const CalendarRoute());
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
            SectionDivider(title: localizations.actions_info),
            // ListTile(
            //   title: const Text('About Us'),
            //   leading: const Icon(LineAwesomeIcons.sitemap_solid),
            //   onTap: () {
            //     tabsRouter.setActiveIndex(3);
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              title: Text(localizations.routes_faq),
              leading: const Icon(Icons.question_mark),
              onTap: () {
                context.navigateTo(const FaqRoute());
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
            SectionDivider(title: localizations.actions_manage),
            ListTile(
              title: Text(localizations.routes_settings),
              leading: const Icon(LineAwesomeIcons.cog_solid),
              onTap: () {
                context.navigateTo(const SettingsRoute());
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
