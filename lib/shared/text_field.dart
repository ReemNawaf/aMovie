import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

InputDecoration kAppTextFieldDec(
        {required String hint, bool isDense = false, Widget? icon}) =>
    InputDecoration(
      suffixIcon: icon,
      isDense: isDense,
      hintText: hint,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColors, width: 6.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColors, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      hintStyle: kSubheadStyle.copyWith(
          color: kBlackColors[600], fontWeight: FontWeight.w600),
    );
