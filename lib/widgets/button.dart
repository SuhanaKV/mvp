import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/primary_text.dart';

Widget button(
  {
    required BuildContext context,
    required GestureTapCallback ontap,
  String? text,
  Color? color,
  Color? borderColor,
  Color? textColor= AppColors.white,
  double? width,
  double? height,
  double? txtSize,
  TextStyle? textStyle,
  FontWeight? txtWeight}
){
  return container(
    width: width ?? MediaQuery.of(context).size.width,
    height: height ?? Dimensions.height42,
    radius: borderColor != null ? Dimensions.radius10 : null,
    border: borderColor != null ?  Border.all(color: borderColor, ) : null,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: textStyle,
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(Dimensions.radius10),
         ),
        backgroundColor: color ?? AppColors.darkBlack,
        shadowColor: color ?? AppColors.darkBlack),
      onPressed: ontap, 
      child: primaryText(text: text, weight: txtWeight ?? FontWeight.w500, size: txtSize ?? Dimensions.txt18, 
      color: textColor)),
  );
}