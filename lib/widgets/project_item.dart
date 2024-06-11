import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/pic_name_row.dart';
import 'package:mvp/widgets/poppins_text.dart';
import 'package:mvp/widgets/priority_box.dart';

Widget ProjectItem(list, {int? index, bool fromTimeLine=false}){


   Widget imageRow(list){
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.width6),
      child: Row(
        children: [ 
          for (int i = 0; i < list.length; i++)
            Align( 
                    widthFactor: 0.6, 
                    child: CircleAvatar( 
                      radius: Dimensions.radius18, 
                      backgroundImage: AssetImage(list[i]), 
                    ), 
                  ),
          Align(
            widthFactor: 0.6, 
            child: Container(
                        width: Dimensions.radius36,
                      height: Dimensions.radius36,
                      clipBehavior: Clip.antiAlias,
                      decoration:  const BoxDecoration(
                        color: AppColors.circleBack,
                        shape: BoxShape.circle),
                        child: Center(child: poppinsText(text: "2+", size: Dimensions.txt12, weight: FontWeight.w300)),
                      ),
          ),
              
      ],),
    );
   }

   Widget priorityRow(){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ 
      priorityBox("High priority"),
        index! % 2 == 0
              ? poppinsText(text: "Pending", size: Dimensions.txt11, weight: FontWeight.w500, color: AppColors.orange)
              : poppinsText(text: "Bused", size: Dimensions.txt11, weight: FontWeight.w500, color: AppColors.green)
      
    ],);
   }

   Widget progressBar(){
    return LinearProgressIndicator(
      value: 0.64,
      valueColor:const AlwaysStoppedAnimation(AppColors.darkBlack),
      backgroundColor: AppColors.grey6,
      borderRadius: BorderRadius.circular(Dimensions.radius8),);
   }

   Widget progressText(){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ 
        poppinsText(text: "Progress", size: Dimensions.txt12, weight: FontWeight.w400),
        poppinsText(text: "64%", size: Dimensions.txt12, weight: FontWeight.w400),

    ],);
   }

      return container(color: AppColors.white,
      radius: Dimensions.radius8,
      shadow: [const BoxShadow(
        color: AppColors.divider1,
        blurRadius: 15, spreadRadius: 0, offset: Offset(0, 0))],
        child: Padding(
          padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: Dimensions.height15, bottom: Dimensions.height18,),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              
               index! % 2 == 0
               ?  picNameRow("assets/images/pic2.png", "Kudos Website", BoxFit.fitWidth, value: true, fromTimeLine: fromTimeLine)
               : picNameRow("assets/images/notipic.jpeg", "Araby ai", BoxFit.cover, fromTimeLine: fromTimeLine),
              SizedBox(height: Dimensions.height15,),
            poppinsText(text: "Task planner App with clean and modern... ", size: Dimensions.txt12, weight: FontWeight.w300,
            color: AppColors.notiLightGrey),
            SizedBox(height: Dimensions.height20,),
            imageRow(list),
            fromTimeLine== false
            ? SizedBox(height: Dimensions.height15,)
            : container(),
            fromTimeLine== false
            ? priorityRow()
            :container(),
            SizedBox(height: Dimensions.height15,),
            progressText(),
            SizedBox(height: Dimensions.height2,),
            progressBar(),
              ]
          ),
        )
      );
  }
