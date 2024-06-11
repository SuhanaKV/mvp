import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/primary_text.dart';

Widget dropDown(){
  List list=["aaa", "bbb", "ccc", "ddd"];
  String selected=list[0]; 

  return SizedBox(
    height: Dimensions.height42,
    child: DropdownButtonFormField<String>(
      dropdownColor: AppColors.white,
      
      icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: Dimensions.txt20,
          style: GoogleFonts.montserrat(
              
              color: AppColors.darkBlack,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.txt14),
          iconEnabledColor: AppColors.darkBlack,
          //value: selected,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width8,
                
                  ),
              
              border: OutlineInputBorder( 
                borderSide: const BorderSide(color: AppColors.dropBorder) ,
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8),
                )                   
               )),
          onChanged: (String? newValue) {
            selected = newValue!;
          },
          items: list.map<DropdownMenuItem<String>>((dynamic value) {
            return  DropdownMenuItem<String>(
              value: value,
              child:  primaryText(
                  text: value,
                  color: AppColors.darkBlack,
                  size: Dimensions.txt14,
                  weight: FontWeight.w500),
            );
          }).toList(),
        ),
  );
}