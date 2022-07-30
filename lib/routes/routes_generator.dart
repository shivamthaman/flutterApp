import 'package:flutter/material.dart';
import 'package:oro/routes/routes.dart';

import '../locker/screen/locker.dart';
import '../home/screen/home.dart';
import '../payment/screen/payment.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Home(),
        );
      case Routes.locker:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Locker(),
        );
      case Routes.payment:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Payment(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
