import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/index.dart';


const String endpoint =
    'https://phpstack-1282091-4643416.cloudwaysapps.com/api/v1/';
const int FIXED_PAGE_COUNT = 15;
const String dummyImage =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png';
const String person_Network_Image =
    'https://cdn-icons-png.freepik.com/512/10100/10100101.png';
const String personImage =
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
const String GAME_AUDIO_URL =
    'https://cdn.uppbeat.io/audio-files/8fd609dd0796beb8fdb9f6f7dff588f4/1cf8d848833fadc778e284a3ecc5dfb6/83a52f9fd144e3c1ce2adb6f8451e5b5/STREAMING-quest-of-legends-vocalista-main-version-26009-02-46.mp3';
TextStyle? primary10 = Style.textStyles.primary(
  fontWeight: FontWeight.w500,
  fontSize: 10.sp,
  color: Style.colors.primary,
);

TextStyle? primary11 = Style.textStyles.primary(
  fontWeight: FontWeight.w500,
  fontSize: 11.sp,
  color: Style.colors.primary,
);

TextStyle? primarySubTitle10 = Style.textStyles.primary(
  fontWeight: FontWeight.w500,
  fontSize: 10.sp,
  color: Style.colors.black,
);

TextStyle? primarySubTitle11 = Style.textStyles.primary(
  fontWeight: FontWeight.w500,
  fontSize: 11.sp,
  color: Style.colors.black,
);

TextStyle? primarySubTitle13 = Style.textStyles.primary(
  fontWeight: FontWeight.w600,
  fontSize: 12.sp,
  color: Style.colors.black,
);

TextStyle? primarySubTitle12 = Style.textStyles.primary(
  fontWeight: FontWeight.w500,
  fontSize: 12.sp,
  color: Style.colors.black,
);

TextStyle? primarySubTitle14 = Style.textStyles.primary(
  fontWeight: FontWeight.bold,
  fontSize: 14.sp,
  color: Style.colors.black,
);
