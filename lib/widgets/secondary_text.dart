import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';

Widget secondaryText({
  String? text,
  double? size,
  Color? color,
  FontWeight? weight
}){
  return Text(text!,
   style: GoogleFonts.montserrat(
    color: color ?? AppColors.secondaryText,
    fontSize: size ?? Dimensions.txt12,
    fontWeight: weight ?? FontWeight.w400),);
}