import 'package:a_movie/a_presentation/search_movies_page/widgets/search_movies_wg.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/strings.dart';
import 'package:a_movie/shared/text_field.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class SearchMoviesPage extends StatefulWidget {
  const SearchMoviesPage({super.key});

  @override
  SearchMoviesPageState createState() => SearchMoviesPageState();
}

class SearchMoviesPageState extends State<SearchMoviesPage> {
  final searchKeyController = TextEditingController();
  String? searchKey;

  @override
  void dispose() {
    searchKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackgroundDec,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kHorPad,
              right: kHorPad,
              top: isPhone() ? 80.0 : 40.0,
            ),
            child: TextFormField(
              controller: searchKeyController,
              style: kSubheadStyle.copyWith(fontWeight: FontWeight.w600),
              onChanged: (value) => setState(() => searchKey = value),
              decoration: kAppTextFieldDec(
                  hint: AppStrings.searchTFHint,
                  icon: const Icon(
                    Icons.search,
                    color: kPrimaryColors,
                  )),
            ),
          ),
          SearchMoviesWidget(searchKey: searchKey)
        ],
      ),
    );
  }
}
