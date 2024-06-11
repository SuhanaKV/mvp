import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';

BoxShadow boxShadow(){
  return const BoxShadow(color: AppColors.shadow, 
            blurRadius: 40, spreadRadius: -4,
            offset: Offset(0, 12));
}