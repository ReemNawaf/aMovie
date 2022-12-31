import 'package:flutter/material.dart';

//  SYSTEM COLORS
//  ------------------------
//  Primary
const int kPrimaryColor = 0xFF837AE3;
const MaterialColor kPrimaryColors = MaterialColor(
  kPrimaryColor,
  <int, Color>{
    400: Color(0xFF40369E),
    500: Color(0xFF837AE3),
    600: Color(0xFF857CDA),
    700: Color(0xFFA59AE2),
  },
);

//  Black
const int kBlackColor = 0xFF1D1D23;
const MaterialColor kBlackColors = MaterialColor(
  kBlackColor,
  <int, Color>{
    400: Color(0xFF1D1D23),
    500: Color(0xFF33333E),
    600: Color(0xFF616178),
  },
);

const Color kWhiteColor = Color(0xFFFBFBFC);

//  Green
const int kGreenColor = 0xFF06D6A0;
const MaterialColor kGreensColor = MaterialColor(
  kGreenColor,
  <int, Color>{
    400: Color(0xFF06D6A0), // kGreenColor
    600: Color(0xFF73FFDB),
    800: Color(0xFFBFFFEF),
  },
);
// Yellow
const int kYellowColor = 0xFFFFCE51;
const MaterialColor kYellowsColor = MaterialColor(
  kYellowColor,
  <int, Color>{
    400: Color(0xFFFFCE51), // kYellowColor
    600: Color(0xFFFFDE89),
    800: Color(0xFFFFECBA),
  },
);
// Red
const int kRedColor = 0xFFEF5B5B;
const MaterialColor kRedsColor = MaterialColor(
  kRedColor,
  <int, Color>{
    400: Color(0xFFEF5B5B),
    500: Color(0xFFFF7A92), // kRedColor
    600: Color(0xFFFF97AF),
    700: Color(0xFFFFD8E1),
  },
);

// ------------------------
// UI COLORS
// ------------------------
const kSuccessUIColor = Color(0xFF06D6A0);
const kWarningUIColor = Color(0xFFFFDA57);
const kErrorUIColor = Color(0xFFFF7A92);
const kShadowColor = Color.fromRGBO(72, 76, 82, 0.16);
