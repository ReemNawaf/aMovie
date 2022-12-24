import 'package:a_movie/pages/favorites_page/favorites_page.dart';
import 'package:a_movie/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.route,
      routes: {
        FavoritesPage.route: (context) => const FavoritesPage(),
      },
    );
  }
}
