import 'package:a_movie/a_presentation/core/widgets/profile_widget.dart';
import 'package:a_movie/c_domain/user/hive_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/strings.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final username = Hive.box<HiveUserModel>('username');
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: kHorPad),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                  valueListenable: username.listenable(),
                  builder: (context, Box<HiveUserModel> item, _) {
                    return Text(
                      '${AppStrings.welcomeMess} ${item.get(0) != null ? item.get(0)!.name : ''} ${AppStrings.welcomeEmoji}',
                      style: kFootnoteStyle.copyWith(
                          color: kBlackColors[600],
                          fontWeight: FontWeight.w500),
                    );
                  }),
              const SizedBox(height: 2.0),
              Text(
                AppStrings.secondLineAppBar,
                style: kFootnoteStyle.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => ProfileWidget(size: size),
            ),
            child: SizedBox(
              height: 75.0,
              width: 75.0,
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
