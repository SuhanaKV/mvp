import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/utils/colors.dart';

Widget poppinsText({
  String? text,
  double? size,
  FontWeight? weight,
  Color? color= AppColors.darkBlack,
  int maxLines=1,
  TextAlign? align
  
}){
  return Text(text!,
  textAlign: align,
  maxLines: maxLines,
   style: GoogleFonts.poppins(
   
    color: color,
    fontSize: size,
    fontWeight: weight),);
}