import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';

Widget circularImage({
  bool? value,
  String? image,
  BoxFit? fit,
}){
  return Container(
            width: Dimensions.height32,
          height: Dimensions.height32,
          clipBehavior: Clip.antiAlias,
          decoration:  BoxDecoration(
            border: value!= null ?  Border.all(color: AppColors.circBorder) : null,
            shape: BoxShape.circle),
            child: Image.asset(image!, fit: fit,),
          );
}