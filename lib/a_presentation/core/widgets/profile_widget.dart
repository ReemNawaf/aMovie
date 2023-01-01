import 'package:a_movie/c_domain/movie/hive_movie_model.dart';
import 'package:a_movie/c_domain/user/hive_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/strings.dart';
import 'package:a_movie/shared/text_field.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final Box<HiveUserModel> _username = Hive.box<HiveUserModel>('username');
  var _name = '';
  var _changeName = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: kBackgroundDec,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      height: widget.size.height * 0.4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 40.0,
              width: 42.0,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kBlackColors[600]!.withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              child: IconButton(
                icon: const Icon(Icons.close_rounded),
                color: kBlackColors[600]!.withOpacity(0.7),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 150.0,
                width: 150.0,
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_username.isEmpty || _changeName)
                    SizedBox(
                      height: 40.0,
                      width: size.width * 0.5,
                      child: TextFormField(
                        initialValue: _username.isNotEmpty
                            ? _username.get(0)!.name
                            : null,
                        style:
                            kSubheadStyle.copyWith(fontWeight: FontWeight.w600),
                        onChanged: (value) => setState(() => _name = value),
                        decoration: kAppTextFieldDec(
                            hint: AppStrings.nameTFHint, isDense: true),
                      ),
                    )
                  else
                    Text(
                      _username.get(0)!.name,
                      style: kSubheadStyle.copyWith(
                          color: _username.isNotEmpty
                              ? kWhiteColor
                              : kBlackColors[600]),
                    ),
                  TextButton(
                    onPressed: () => _username.isNotEmpty
                        ? _changeName
                            ? _username.put(0, HiveUserModel(name: _name))
                            : setState(() => _changeName = true)
                        : _username.put(0, HiveUserModel(name: _name)),
                    child: Text(
                      _username.isNotEmpty ? 'Change my name' : 'Add my name',
                      style: kSubheadStyle.copyWith(
                          color: kPrimaryColors, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: kBlackColors,
                    title: Text(
                      'Reset All My Movies Data',
                      style: kbodyeStyle.copyWith(color: kPrimaryColors),
                    ),
                    content: Text(
                        'This option will delete all your movies saved data.',
                        style: kSubheadStyle.copyWith(
                            color: kWhiteColor, fontWeight: FontWeight.w500)),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'cancel',
                            style:
                                kFootnoteStyle.copyWith(color: kPrimaryColors),
                          )),
                      TextButton(
                          onPressed: () {
                            Hive.box<HiveUserModel>('username').clear();

                            Hive.box<HiveMovieModel>('movie_watching_list')
                                .clear();
                            Hive.box<HiveMovieModel>('movie_favorite_list')
                                .clear();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Ok',
                            style: kFootnoteStyle.copyWith(
                                color: kBlackColors[600]),
                          )),
                    ],
                  ),
                ),
                child: Text(
                  'Reset All My Movies Data',
                  style: kSubheadStyle.copyWith(
                      color: kPrimaryColors, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
