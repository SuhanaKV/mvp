import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/circular_image.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/poppins_text.dart';

Widget picNameRow(image, text, fit, {bool? value, bool fromNotifi=false, required bool fromTimeLine}){
  return Row(children: [ 
    fromTimeLine == false
    ? Row(children: [ 
      circularImage(value: value, image: image, fit: fit),
          SizedBox(width: Dimensions.padding10,),
          poppinsText(text: text, size: Dimensions.txt14, weight: FontWeight.w500),
    ],)
    : poppinsText(text: "MVP Mobile App Design", weight: FontWeight.w500, size: Dimensions.txt14,),
          const Spacer(),
          fromNotifi == false
          ? SvgPicture.asset("assets/icons/three-dots.svg")
          : container(),
  ],);
}