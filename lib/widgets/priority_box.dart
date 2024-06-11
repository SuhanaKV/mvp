import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/poppins_text.dart';

Widget priorityBox(text){
  return container(
        width: Dimensions.width100,
        height: Dimensions.height25,
        color: AppColors.white,
        radius: Dimensions.radius8,
        border: Border.all(color: AppColors.grey5),
        child: Row(children: [ 
          SizedBox(width: Dimensions.height6,),
          Icon(Icons.circle, color: AppColors.red1, size: Dimensions.height8,),
          SizedBox(width: Dimensions.height6,),
          poppinsText(text: text, size: Dimensions.txt11, weight: FontWeight.w400 ),
        ],),
      );
}