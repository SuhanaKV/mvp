import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/views/home_view/showmodel_bottomsheet.dart';
import 'package:mvp/widgets/back_button.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/primary_text.dart';
import 'package:mvp/widgets/secondary_text.dart';

class TaskDetails extends StatefulWidget {
  bool? taskStatus;
   TaskDetails(this.taskStatus, { super.key });

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  List<String>  dataList= ["20 Points", "10 Hours", "Approved Ali"];
  var started =false;

  Widget bottomSheetChild(){
    Widget iconText(icon, text, {bool? delete}){
      return Row(children: [ 
        SvgPicture.asset(icon,),
        SizedBox(width: Dimensions.width15,),
        secondaryText(text: text, size: Dimensions.txt16, color: delete ==true
        ? AppColors.red1 : AppColors.black1),
      ],);
    }

    return Padding(padding: EdgeInsets.all(Dimensions.height15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [ 
      SvgPicture.asset("assets/icons/close.svg"),
      Padding(padding: EdgeInsets.all(Dimensions.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          iconText("assets/icons/edit.svg", "Edit task"),
          Divider(color: AppColors.divider1, height: Dimensions.height30,),
          iconText("assets/icons/duplicate.svg", "Duplicate task"),
          Divider(color: AppColors.divider1, height: Dimensions.height30,),
          iconText("assets/icons/delete.svg", "Delete task", delete: true),
        ],
      ),)
    ],),);
  }
  
  PreferredSizeWidget appBar(){
    return AppBar(
      leading: backButton(context),
      actions: [const Spacer(),
      Padding(
        padding:  EdgeInsets.only(right: Dimensions.width15, top: Dimensions.width15),
        child: InkWell(
          onTap: () {
             sshowModelBottomSheet(context, bottomSheetChild(), 0.3);
             },
          child: SvgPicture.asset("assets/icons/three-dots.svg")),
      ),],
    );
  }

  Widget gridItem(text){
    List<String> list=text.split(' ');

    return container(color: AppColors.grey4,
    child: Padding(padding: EdgeInsets.all(Dimensions.height18),
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [primaryText(text: list[0], weight: FontWeight.w600, size: Dimensions.txt18),
      secondaryText(text: list[1], size: Dimensions.txt14 )]),
    ));
  }

  Widget grid(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.height30, vertical: Dimensions.height30 ),
      child: GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: Dimensions.height30,
          crossAxisSpacing: Dimensions.height30,
          crossAxisCount: 2), 
          itemCount: dataList.length,
        itemBuilder: (context, index){
           return gridItem(dataList[index]);
        }),
    );
  }

  Widget timeWidget(){
    
    Widget timeColumn(text1, text2){
      return Column(children: [ 
        secondaryText(text: text1, size: Dimensions.txt14, color: AppColors.grey3),
        SizedBox(height: Dimensions.height15,),
        primaryText(text: text2, size: Dimensions.txt15, weight: FontWeight.w500),
      ],);
    }

    return Column(children: [ 
      Padding(
        padding:  EdgeInsets.symmetric(vertical: Dimensions.height8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 
            timeColumn("Start date", "4Apr2024"),
            timeColumn("Start time", " 04:45PM"),
        ],),
      ),
      Divider(color: AppColors.disabledGrey,  height: Dimensions.height25,),
    ],);
  }

  Widget contents(){
    return SingleChildScrollView(
      child: Padding(
          padding:  EdgeInsets.all(Dimensions.padding16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
            secondaryText(text: "Project name" , color: AppColors.grey3, size: Dimensions.txt14),
            SizedBox(height: Dimensions.height16,),
            primaryText(text: "Mvp Task manager", size: Dimensions.txt23, weight: FontWeight.w600),
            Divider(color: AppColors.disabledGrey, height: Dimensions.height25,),
            secondaryText(text: "Task details" , color: AppColors.grey3, size: Dimensions.txt14),
            SizedBox(height: Dimensions.height12,),
            primaryText(text: "Design Task management App ", size: Dimensions.txt17, weight: FontWeight.w500),
            Divider(color: AppColors.disabledGrey,  height: Dimensions.height25,),
            secondaryText(text: "Description " , color: AppColors.grey3, size: Dimensions.txt14),
            SizedBox(height: Dimensions.height12,),
            primaryText(text: "Design Task management App  Design Task management App  Design Task management App  Design Task management App  Design Task",
             size: Dimensions.txt15, weight: FontWeight.w500),
            Divider(color: AppColors.disabledGrey,  height: Dimensions.height25,),
            started==true
            ? timeWidget()
            : grid(),
      
          ],),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    started=widget.taskStatus!;  

    return SafeArea(
      child: Scaffold(backgroundColor: AppColors.white,
      appBar: appBar(),
      body: contents()));
  }
}