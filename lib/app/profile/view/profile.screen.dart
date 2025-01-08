import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:task_trecker/layouts/app_drawer/app_drawer.dart';
import 'package:task_trecker/router/router.gr.dart';
import 'package:task_trecker/utils/finals/global/styles.dart';
import 'package:task_trecker/utils/finals/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tabsRouter = AutoTabsRouter.of(context);
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(localizations!.routes_profile),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              top: 40,
              bottom: pageDefaultSize,
              left: pageDefaultSize,
              right: pageDefaultSize),
          child: Center(
            child: Column(children: [
              /// Main Profile Data
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image(image: AssetImage(defaultProfileImage)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: theme.primaryColor),
                      child: const Icon(
                        LineAwesomeIcons.pencil_alt_solid,
                        size: 35 / 2,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 3),
                child: Text('Name',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Text('mail@gmail.com', style: theme.textTheme.bodyMedium),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      context.navigateTo(EditRoute());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor),
                    child: Text(localizations.actions_edit_profile)),
              ),
              ProfileDividerWidget(),

              /// Menu
              ProfileMenuWidget(
                icon: LineAwesomeIcons.user_check_solid,
                title: localizations.user_management,
                onTap: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.wallet_solid,
                title: localizations.billing,
                onTap: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.info_solid,
                title: localizations.actions_info,
                onTap: () {},
              ),
              ProfileDividerWidget(),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.sign_out_alt_solid,
                title: localizations.actions_logout,
                onTap: () {},
                textColor: Colors.deepOrange,
                disableRightArrow: true,
                iconColor: Colors.deepOrange,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class ProfileDividerWidget extends StatelessWidget {
  const ProfileDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Divider(),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  ProfileMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor = Colors.transparent,
    this.disableRightArrow = false,
    this.iconColor = null,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  final Color textColor;
  final bool disableRightArrow;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromARGB(25, 0, 0, 0)),
        child: Icon(icon, color: iconColor,),
      ),
      title: Text(title,
          style: TextStyle(
              fontSize: theme.textTheme.bodyMedium?.fontSize,
              fontWeight: theme.textTheme.bodyMedium?.fontWeight,
              color: textColor == Colors.transparent
                  ? theme.textTheme.bodyMedium?.color
                  : textColor)),
      trailing: !disableRightArrow
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.grey.withOpacity(0.1)),
              child: const Center(
                child: Icon(
                  LineAwesomeIcons.angle_right_solid,
                  size: 15,
                  // color: Colors.grey,
                ),
              ),
            )
          : null,
    );
  }
}
