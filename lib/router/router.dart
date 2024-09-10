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
            page: SettingsRoute.page,
            path: 'settings',
          ),
          AutoRoute(
            page: CalendarRoute.page,
            path: 'calendar',
          ),
        ]),
      ];
}
