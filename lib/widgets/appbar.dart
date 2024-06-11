import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/back_button.dart';
import 'package:mvp/widgets/primary_text.dart';

PreferredSizeWidget appBar(context,  text){
    return AppBar(
      centerTitle: true,
      leading: backButton(context),
      title: Padding(
        padding:  EdgeInsets.only(top: Dimensions.height15),
        child: primaryText(
          text: text,
          weight: FontWeight.w600, size: Dimensions.txt16,
          color: AppColors.black1
        ),
      ),
    );
  }