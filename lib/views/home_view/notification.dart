import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/appbar.dart';
import 'package:mvp/widgets/button.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/pic_name_row.dart';
import 'package:mvp/widgets/poppins_text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({ super.key });

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var approvePressed=true;
  var denyPressed=false;

  

  Widget list(){
    
    Widget listItem(){
      return container(color: AppColors.white,
      radius: Dimensions.radius8,
      shadow: [const BoxShadow(
        color: AppColors.divider1,
        blurRadius: 15, spreadRadius: 0, offset: Offset(0, 0))],
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Padding(padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: Dimensions.height15,),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
              picNameRow("assets/images/notipic.jpeg", "Araby ai", BoxFit.cover, fromNotifi: true, fromTimeLine: false),
            SizedBox(height: Dimensions.padding10,),
            poppinsText(text: "Task planner App with clean and modern... ", size: Dimensions.txt12, weight: FontWeight.w300,
            color: AppColors.notiLightGrey),
            ],),),
            
            Divider(height: Dimensions.height30, color: AppColors.divider,),
            Padding(padding: EdgeInsets.only( left: Dimensions.height15, right: Dimensions.height15, bottom: Dimensions.height20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
              poppinsText(text: "Link preview", size: Dimensions.txt12, weight: FontWeight.w400),
            SizedBox(height: Dimensions.padding5,),
            poppinsText(text: "www.update username home and profile, edit password", size: Dimensions.txt12, weight: FontWeight.w300,
            color: AppColors.notiDarkGrey),
            SizedBox(height: Dimensions.padding16,),
            Row(children: [ 
             button(
              context: context,
              ontap: (){
                           denyPressed=!denyPressed;
                           approvePressed=!approvePressed; 

                  },
                  width: Dimensions.width100,
                  height: Dimensions.height30,
                  txtSize: Dimensions.txt11,
                  txtWeight: FontWeight.w400,
                  textStyle: GoogleFonts.poppins(),
                  text: "Approve",
                  color: approvePressed ==true ? AppColors.darkBlack : AppColors.white,
                  textColor: approvePressed ==true ? AppColors.white : AppColors.darkBlack,
                  borderColor: AppColors.darkBlack,),
              SizedBox(width: Dimensions.width20,),
              button(
                context: context,
                ontap: (){
                           denyPressed=!denyPressed;
                           approvePressed=!approvePressed; 

                  },
                  width: Dimensions.width80,
                  height: Dimensions.height30,
                  txtSize: Dimensions.txt11,
                  txtWeight: FontWeight.w400,
                  textStyle: GoogleFonts.poppins(),
                  text: "Deny",
                  color: denyPressed ==true ? AppColors.darkBlack : AppColors.white,
                  textColor: denyPressed ==true ? AppColors.white : AppColors.darkBlack,
                  borderColor: AppColors.darkBlack,),
            ],)
            ],),)
        
        
        ],)
      );
    }
    
    return Padding(
      padding: EdgeInsets.all(Dimensions.width15),
      child: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index){
          return listItem();
        }, separatorBuilder: (BuildContext context, int index) { 
          return SizedBox(height: Dimensions.height25,);
         },),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold( 
      appBar: appBar(context, "Notification"),
      body: list(),
    ));
  }
}