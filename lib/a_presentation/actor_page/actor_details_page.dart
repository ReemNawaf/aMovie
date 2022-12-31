import 'package:a_movie/a_presentation/actor_page/page_builders.dart';
import 'package:a_movie/a_presentation/actor_page/widgets/actor_details_wg.dart';
import 'package:a_movie/a_presentation/core/widgets/simple_app_bar.dart';
import 'package:a_movie/c_domain/actors/actor_details_model.dart';
import 'package:a_movie/b_application/movies_providers.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActorDetailsPage extends ConsumerWidget {
  const ActorDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: kBackgroundDec,
        padding: EdgeInsets.only(top: size.height * 0.07),
        child: Column(
          children: [
            const SimpleAppBar(title: 'Actor Details'),
            FutureBuilder<ActorDetailsModel>(
              future: ref.read(actorRepoProvider).getActorDetails(id),
              builder: (context, AsyncSnapshot<ActorDetailsModel> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error != null &&
                      snapshot.data!.error!.isNotEmpty) {
                    return buildErrorWidget(snapshot.data!.error);
                  } else {
                    return SizedBox(
                      height: size.height * 0.878,
                      child: ActorDetailsWidget(
                        size: size,
                        actor: snapshot.data!,
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return buildErrorWidget(snapshot.error);
                } else {
                  return buildLoadingWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
