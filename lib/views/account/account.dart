import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/alert_dialog.dart';
import 'package:mvp/widgets/box_shadow.dart';
import 'package:mvp/widgets/button.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/custom-switch.dart';
import 'package:mvp/widgets/poppins_text.dart';
import 'package:mvp/widgets/primary_text.dart';
import 'package:mvp/widgets/secondary_text.dart';
import 'package:mvp/widgets/textfield.dart';

class Account extends StatefulWidget {
  const Account({ super.key });

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var isSwitched=false;
  var yesPressed=true;
  var noPressed=false;

  Widget dialogheader(text){
    return Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                    Expanded(child: Center(child: poppinsText(text: text, weight: FontWeight.w500, size: Dimensions.txt14))),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset("assets/icons/close.svg")),
                  
                  ],);
  }

  Widget items(){

    Widget dialogContent(){
      return container(
        height: Dimensions.height300,
         child: Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: container(
                child: Column(children: [ 
                  dialogheader("Logout"),
                  SizedBox(height: Dimensions.height20,),
                  Padding(padding: EdgeInsets.all(Dimensions.padding10),
                  child: Column(children: [  
                    poppinsText(text: "Are You sure you want to logout?", weight: FontWeight.w400, size: Dimensions.txt18),
                  SizedBox(height: Dimensions.height20,),
                   button(
                    context: context,
                    ontap: (){
                          yesPressed=!yesPressed; 
                          noPressed=!noPressed;
                           Navigator.pop(context);
                  },
                  text: "Yes",
                  color: yesPressed ==true ? AppColors.darkBlack : AppColors.white,
                  textColor: yesPressed ==true ? AppColors.white : AppColors.darkBlack,
                  borderColor:  AppColors.darkBlack  ),
                  SizedBox(height: Dimensions.height20,),
                   button(
                    context: context,
                    ontap: (){
                           noPressed=!noPressed;
                           yesPressed=!yesPressed; 
                           Navigator.pop(context);

                  },
                  text: "No",
                  color: noPressed ==true ? AppColors.darkBlack : AppColors.white,
                  textColor: noPressed ==true ? AppColors.white : AppColors.darkBlack,
                  borderColor: AppColors.darkBlack,)
                            
                  ],),)
                ],),
              ),),
       );
    }
    
    Widget iconText(asset, text, {bool? dark,}){
      return InkWell(
        onTap: () {
          showDialog(context: context, builder: (BuildContext context) => alertDialog(dialogContent()));
          //alertDialog(dialogContent());
        },
        child: Row(children: [ 
          container(
            width: dark==null ? Dimensions.height30 : Dimensions.height25 ,
            height: dark==null ? Dimensions.height30 : Dimensions.height25 ,
            child: SvgPicture.asset(asset, fit: BoxFit.fill,)),
          SizedBox(width: Dimensions.width10,),
          primaryText(text: text, color: AppColors.grey2 , size: Dimensions.txt13, weight: FontWeight.w500),
          const Spacer(),
          dark ==true
          ? CustomSwitch(
          value: isSwitched,
          onChanged: (bool val){
            setState(() {
              isSwitched = val;
            });
          },
        )
          : container(),
        ],),
      );
    }

    return container(color: AppColors.white,
    radius: Dimensions.radius12,
    shadow: [boxShadow()],
    child: Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: Dimensions.width20),
    child: Column(children: [ 
      iconText("assets/icons/notification.svg", "Notifications"),
      Divider(height: Dimensions.height25, color: AppColors.divider,),
      iconText("assets/icons/dark-mode.svg", "Dark mode", dark: true),
      Divider(height: Dimensions.height25, color: AppColors.divider,),
      iconText("assets/icons/logout.svg", "Logout"),
    ],),));
  }

  Widget passwordBox(){
    
    Widget dialogContent(){
      return container(
        radius: Dimensions.radius10,
        height: Dimensions.height300,
       color: AppColors.white,
       child: Padding(padding: EdgeInsets.all(Dimensions.padding16),
       child: Column(children: [ 
        dialogheader("Edit Password"),
        SizedBox(height: Dimensions.height25,),
        container(
          height: Dimensions.height60,
          child: poppinsText(text: "Please enter your email account to send code !", maxLines: 2,
          align: TextAlign.center,
          size: Dimensions.txt20, weight: FontWeight.w400)),
        SizedBox(height: Dimensions.height30,),
        textfield(hint: "Email", 
        ),
        SizedBox(height: Dimensions.height25,),
        button(
          context: context,
          ontap: (){
          Navigator.pop(context);
        },
        text: "Submit"
        )
        
       ],),
    ));
    }


    return container(radius: Dimensions.radius8,
    color: AppColors.white,
    shadow: [boxShadow()],
    child: Padding(padding: EdgeInsets.all(Dimensions.padding16),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ 
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
        primaryText(text: "Password", color: AppColors.grey2 , size: Dimensions.txt13, weight: FontWeight.w500),
        SizedBox(height: Dimensions.padding10,),
        Row(
          children: [
            Icon(Icons.password, size: Dimensions.txt12,),
            Icon(Icons.password, size: Dimensions.txt12,),
          ],
        )
      ],),
      InkWell(
        onTap: () {
           showDialog(context: context, builder: (BuildContext context) => alertDialog(dialogContent()));
        },
        child: secondaryText(text: "Edit", size: Dimensions.txt11, weight: FontWeight.w400))
    ],),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.only(left: Dimensions.padding10, right: Dimensions.padding10, top: Dimensions.height70 ),
          child: Column(children: [ 
            primaryText(text: "Kyle Calica", weight: FontWeight.w700, size: Dimensions.txt16, color: AppColors.black1 ),
            SizedBox(height: Dimensions.width6,),
            secondaryText(text: "nathan@mvp-apps.com", color: AppColors.black1),
            SizedBox(height: Dimensions.height50,),
            passwordBox(),
            SizedBox(height: Dimensions.height12,),
            items(),
          ],),),
        )
      ),
    );
  }
}