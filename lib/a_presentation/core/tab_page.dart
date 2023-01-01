import 'package:a_movie/a_presentation/core/widgets/web_app_ground.dart';
import 'package:a_movie/a_presentation/search_movies_page/search_movies_page.dart';
import 'package:a_movie/a_presentation/saved_movies_page/saved_movies_page.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/a_presentation/home_page/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});
  static const String route = '/';

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  final List<Widget> pages = const [
    HomePage(),
    SearchMoviesPage(),
    SavedMoviesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlackColors,
      body: WebAppGround(
        child: SizedBox(
          width: screenWidth(screenSize),
          height: screenHeight(screenSize),
          child: pages[selectedPageIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBlackColors,
        selectedItemColor: kPrimaryColors,
        unselectedItemColor: kWhiteColor.withOpacity(0.2),
        selectedLabelStyle: kCaption1Style,
        type: BottomNavigationBarType.shifting,
        onTap: (index) => _selectPage(index),
        currentIndex: selectedPageIndex,
        items: [
          getBottomNavigationBarItem(
            isSelected: 0 == selectedPageIndex,
            label: 'Home',
            iconName: 'home',
          ),
          getBottomNavigationBarItem(
            isSelected: 1 == selectedPageIndex,
            label: 'Explore',
            iconName: 'category',
          ),
          getBottomNavigationBarItem(
            isSelected: 2 == selectedPageIndex,
            label: 'Saved',
            iconName: 'saved',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem getBottomNavigationBarItem({
    required String label,
    required String iconName,
    required bool isSelected,
  }) =>
      BottomNavigationBarItem(
        backgroundColor: kBlackColors,
        icon: SvgPicture.asset('assets/icons/$iconName.svg',
            color: isSelected ? kPrimaryColors : kBlackColors[600]),
        label: label,
      );
}
