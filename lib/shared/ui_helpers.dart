import 'package:a_movie/shared/app_colors.dart';
import 'package:flutter/material.dart';

const divider = Expanded(child: Divider(thickness: 1));
const vertSpacing8 = SizedBox(height: 8.0);
const kBackgroundDec = BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xFF2C2C35), Color(0xFF19191F)]));

final movieCardDec = BoxDecoration(
  color: kBlackColors[500],
  borderRadius: const BorderRadius.all(Radius.circular(20)),
  shape: BoxShape.rectangle,
);
