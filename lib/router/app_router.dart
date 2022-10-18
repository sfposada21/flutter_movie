
import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes{

  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
      'home'      : ( BuildContext context) => const HomeScreen(),
      'detail'  : ( BuildContext context) => const DetailsScreen(),
      };
}