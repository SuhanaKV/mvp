import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/container.dart';

Widget backButton(context){
  return Padding(
        padding:  EdgeInsets.only(left: Dimensions.width15, top:Dimensions.width15 , right: Dimensions.width15),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: container(
            width: Dimensions.width20,
            height: Dimensions.width20,
            child: SvgPicture.asset("assets/icons/back.svg")),
        ),
      );
}