import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/appbar.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/poppins_text.dart';
import 'package:mvp/widgets/primary_text.dart';
import 'package:mvp/widgets/priority_box.dart';
import 'package:mvp/widgets/project_item.dart';

class Calendar extends StatefulWidget {
  const Calendar({ super.key });

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<String> list1=["assets/images/profile1.jpeg", "assets/images/profile2.jpeg", "assets/images/profile3.jpeg","assets/images/profile4.png"];

 
  Widget verticalList(){

     Widget horizontalRow(){
    
       Widget horizontalItem(index){
        return Padding(
          padding:  EdgeInsets.only(right: Dimensions.height20,),
          child: container(width: MediaQuery.of(context).size.width/2.3,
           color: AppColors.white,
           radius: Dimensions.radius8,
           shadow: [const BoxShadow(
           color: AppColors.divider1,
           blurRadius: 15, spreadRadius: 0, offset: Offset(0, 0))],
           child: Padding(padding: EdgeInsets.all(Dimensions.height8),
           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                container(
                  width: Dimensions.width100,
                  child: poppinsText(text: "Meeting with client", size: Dimensions.txt13, weight: FontWeight.w500, maxLines: 2)),
                const Spacer(),
                SvgPicture.asset("assets/icons/three-dots.svg")
            ],),
            SizedBox(height: Dimensions.height20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                poppinsText(text: "Time", size: Dimensions.txt12, weight: FontWeight.w300, color: AppColors.grey),
                const Spacer(),
                poppinsText(text: "11:00Pm", size: Dimensions.txt12, weight: FontWeight.w400, color: AppColors.darkBlack),
            ],),
            SizedBox(height: Dimensions.height20,),
            index%2 ==0
            ?
            priorityBox("High priority") :priorityBox("Low priority"),
            SizedBox(height: Dimensions.height20,),
            container(color: AppColors.grey6,
            radius: Dimensions.radius3,
            child: Padding(padding: EdgeInsets.all(Dimensions.height6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
              poppinsText(text: "www.https://zoom.us/", size: Dimensions.txt11, weight: FontWeight.w400),
              SvgPicture.asset("assets/icons/copy.svg")
            ],),)
            )
          ],),)),
        );
    }

    return SizedBox(
      height: Dimensions.height230,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding:  EdgeInsets.only(bottom: Dimensions.height20,),
        itemBuilder: (context, index){
          return horizontalItem(index);
        }, ),
    );
  }


    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context,index){
        if(index==1){
          return horizontalRow();
        }
        return Padding(
          padding:  EdgeInsets.only(bottom: Dimensions.height20),
          child: ProjectItem(list1, index: 0, fromTimeLine: true),
        );
      },  itemCount: 4);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context,"Time Line"),
        body: SingleChildScrollView(child: Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.width15, 
        vertical: Dimensions.height20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            primaryText(text: "May,18\n24,Tusday", weight: FontWeight.w600, size: Dimensions.txt24, color: AppColors.black1),
            SizedBox(height: Dimensions.height20,),
            verticalList(),
           // ProjectItem(list1, index: 0, fromTimeLine: true),
            //horizontalRow(),
        ],),
        ),)
      ),
    );
  }
}