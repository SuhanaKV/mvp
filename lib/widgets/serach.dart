import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/container.dart';

Widget search(){
  return container(color: AppColors.notificationBack, 
  
  radius: Dimensions.radius12,
  height: Dimensions.height42,
  child: Padding(padding: EdgeInsets.all(Dimensions.height12),
  child: Row(children: [ 
    SvgPicture.asset("assets/icons/search.svg"),
    SizedBox(width: Dimensions.width10,),
    Expanded(
      child: TextField(decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search your task",
        hintStyle: GoogleFonts.montserrat(
          fontSize: Dimensions.txt14, color: AppColors.grey2
        ),
        contentPadding: EdgeInsets.only(bottom: Dimensions.height12)
      ),),
    )
  ],),) );
}