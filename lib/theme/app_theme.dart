import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final _baseStyle = GoogleFonts.rubik(color: AppColors.textColor);

final appTheme = ThemeData(
    textTheme: TextTheme(
      headline6: _baseStyle.copyWith(fontSize: 26),
      headline5: _baseStyle.copyWith(fontSize: 24, color: AppColors.white),
      headline4: _baseStyle.copyWith(fontSize: 22, color: AppColors.white),
      headline3: _baseStyle.copyWith(fontSize: 22, color: AppColors.white),
    ));
