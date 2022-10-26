import 'package:flutter/material.dart';
import 'package:interview_task/modules/get%20started/get_started_screen.dart';
import 'package:interview_task/modules/home/screens/home_screen.dart';
import 'package:interview_task/modules/introduction_screen/introduction_screen.dart';

// All routes for the application.
class Routes {
  static const String initialRoute = '/';
  static const String introduction = 'introduction';
  static const String home = 'home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const GetStartedScreen());
      case Routes.introduction:
        return MaterialPageRoute(
            builder: (BuildContext context) => const IntroductionScreen());
      case Routes.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NoRouteFound());
    }
  }
}

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}
