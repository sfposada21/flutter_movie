import 'package:flutter/material.dart';
import 'package:peliculas/router/app_router.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:peliculas/themes/app_theme.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/providers/movies_provider.dart';
 
void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,  
      theme: AppTheme.lightTheme

    );
  }
}