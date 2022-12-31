import 'package:a_movie/a_presentation/core/tab_page.dart';
import 'package:a_movie/a_presentation/genres_page/genres_page.dart';
import 'package:a_movie/a_presentation/home_page/home_page.dart';
import 'package:a_movie/c_domain/movie/hive_movie_model.dart';
import 'package:a_movie/c_domain/user/hive_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Hive.initFlutter();
  Hive.registerAdapter(HiveMovieModelAdapter());
  Hive.registerAdapter(HiveUserModelAdapter());
  await Hive.openBox<HiveMovieModel>('movie_watching_list');
  await Hive.openBox<HiveMovieModel>('movie_favorite_list');
  await Hive.openBox<HiveUserModel>('username');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String route = '/';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aMovie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(
              headline6: kTitle1Style,
              headline5: kTitle2Style,
              headline4: kTitle3Style,
              headline3: kTitle3Style,
              headline2: kTitle3Style,
              headline1: kTitle3Style,
              bodyText1: kbodyeStyle,
              bodyText2: kBodyText2Style,
            )
            .apply(fontFamily: 'CarmenSans'),
        primaryColor: kPrimaryColors,
        colorScheme: const ColorScheme(
          primary: kPrimaryColors,
          secondary: kBlackColors,
          surface: kBlackColors,
          background: kBlackColors,
          error: kRedsColor,
          onPrimary: kWhiteColor,
          onSecondary: kPrimaryColors,
          onSurface: kWhiteColor,
          onBackground: kWhiteColor,
          onError: kRedsColor,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: kWhiteColor,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kBlackColors, width: 1.5),
          ),
        ),
      ),
      initialRoute: TabPage.route,
      routes: {
        TabPage.route: (context) => const TabPage(),
        HomePage.route: (context) => const HomePage(),
        GenresPage.route: ((context) => const GenresPage())
      },
    );
  }
}
