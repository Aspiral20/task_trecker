import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainLayout.page, path: '/', children: [
          AutoRoute(
            page: HomeRoute.page,
            path: '',
          ),
          AutoRoute(
            page: CalendarRoute.page,
            path: 'calendar',
          ),
          AutoRoute(
            page: ProfileRoute.page,
            path: 'profile',
          ),
          AutoRoute(
            page: EditRoute.page,
            path: 'profile_edit',
          ),
          AutoRoute(
            page: FaqRoute.page,
            path: 'faq',
          ),
          AutoRoute(
            page: SettingsRoute.page,
            path: 'settings',
          ),
        ]),
      ];
}
