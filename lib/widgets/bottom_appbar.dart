import 'package:flutter/material.dart';
import 'package:mvp/routes/route_helper.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/views/account/account.dart';
import 'package:mvp/views/calendar/calendar.dart';
import 'package:mvp/views/home_view/home.dart';
import 'package:mvp/views/projects/projects.dart';
import 'package:mvp/widgets/primary_text.dart';

Widget bottomAppBar(context){

    Widget bottomNavBarItem( label, icon, page){
      return InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(page);
        },
        child: Column(children: [  
          Icon(icon),
          SizedBox(height: Dimensions.height6,),
          primaryText(text: label, size: Dimensions.txt10, weight: FontWeight.w600, color: AppColors.darkBlack)
        
        ],),
      );
    }

    return BottomAppBar(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [ 
        bottomNavBarItem("Home", Icons.home_outlined, RouteHelper.home),
        bottomNavBarItem("Projects", Icons.folder, RouteHelper.project),
        Container(
            width: Dimensions.height90,
          height: Dimensions.height90,
          decoration: const BoxDecoration(
            color: AppColors.darkBlack,
            shape: BoxShape.circle),
            child: Padding(
              padding:  EdgeInsets.all(Dimensions.padding16),
              child: Icon(Icons.add, color: AppColors.white, size: Dimensions.txt25,),
            ),
          ),
        bottomNavBarItem("Calendar", Icons.calendar_month, RouteHelper.timeLine),
        bottomNavBarItem("Account", Icons.person_2, RouteHelper.account),
      ],),

    );
  }
