import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/container.dart';

Widget textfield(
  {
    TextEditingController? controller,
    String? hint,
    double? height,
    bool obscureText=false,
    int? maxLines,
    List<BoxShadow>? shadow,
  }
){
  return container(
    height: height ?? Dimensions.height42,
  
    child: TextFormField(
      maxLines: maxLines ?? 1,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
      
        contentPadding: EdgeInsets.only(top: Dimensions.height2, left: Dimensions.width10, ),
        hintText: hint,
        hintStyle: GoogleFonts.montserrat(
          fontSize: Dimensions.txt14,
          fontWeight: FontWeight.w400,
          color: AppColors.darkBlack
        ),
        border: OutlineInputBorder(
          borderSide:  const BorderSide(color:  AppColors.textFieldBorder,),
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius10),
          )
        )
      ),
    ),
  );
}