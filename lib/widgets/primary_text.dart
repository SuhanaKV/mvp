import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/utils/colors.dart';

Widget primaryText({
  String? text,
  double? size,
  FontWeight? weight,
  Color? color= AppColors.darkBlack
}){
  return Text(text!,
   style: GoogleFonts.montserrat(
   
    color: color,
    fontSize: size,
    fontWeight: weight),);
}