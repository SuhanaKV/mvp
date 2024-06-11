import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';

alertDialog(child){
   
   return  Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        shadowColor:AppColors.white ,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius18),
        ),
         child: child            
               
         
     );
}