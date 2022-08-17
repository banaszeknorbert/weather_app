import 'package:go_router/go_router.dart';
import 'package:weather_app/screen/home/home_screen.dart';
import 'package:weather_app/screen/splash/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (_, __) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (_, __) {
        return HomeScreen();
      },
    ),
  ],
);