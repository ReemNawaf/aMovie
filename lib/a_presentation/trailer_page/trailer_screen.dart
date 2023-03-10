import 'package:a_movie/a_presentation/core/widgets/web_app_ground.dart';
import 'package:a_movie/a_presentation/trailer_page/widgets/phone_yt_wg.dart';
import 'package:a_movie/a_presentation/trailer_page/widgets/web_yt_wg.dart';
import 'package:a_movie/b_application/movies_providers.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'package:a_movie/c_domain/trailers_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrailersScreen extends ConsumerWidget {
  const TrailersScreen({Key? key, required this.shows, required this.id})
      : super(key: key);
  final String shows;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: WebAppGround(
        child: SizedBox(
          width: screenWidth(size),
          height: screenHeight(size),
          child: Container(
            decoration: kBackgroundDec,
            child: FutureBuilder<TrailersModel>(
              future: ref.read(movieRepoProvider).getTrailers(shows, id),
              builder: (context, AsyncSnapshot<TrailersModel> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error != null &&
                      snapshot.data!.error!.isNotEmpty) {
                    return _buildErrorWidget(snapshot.data!.error);
                  }
                  return _buildTrailersWidget(snapshot.data!, context);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error);
                } else {
                  return _buildLoadingWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            width: 25.0,
            height: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          )
        ],
      ),
    );
  }

  //display error
  Widget _buildErrorWidget(dynamic error) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorPad),
      child: Text(
        'Oops, movie trailer couldn\'t be loaded, check your internect connection.',
        textAlign: TextAlign.center,
        style: kFootnoteStyle.copyWith(
          color: kBlackColors[600],
        ),
      ),
    );
  }

  Widget _buildTrailersWidget(TrailersModel data, BuildContext context) {
    return Stack(
      children: [
        Center(
          child: isPhonePlatform()
              ? PhoneYouTubeWidget(data)
              : WebYouTubeWidget(data),
        ),
        //close button
        Positioned(
          top: 60,
          right: 20,
          child: IconButton(
            icon: const Icon(Icons.close_sharp),
            color: kPrimaryColors,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
