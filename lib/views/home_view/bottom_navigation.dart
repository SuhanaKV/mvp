import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/provider/bottom_nav_provider.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/views/account/account.dart';
import 'package:mvp/views/calendar/calendar.dart';
import 'package:mvp/views/home_view/home.dart';
import 'package:mvp/views/home_view/showmodel_bottomsheet.dart';
import 'package:mvp/views/projects/projects.dart';
import 'package:mvp/widgets/button.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/drop_down.dart';
import 'package:mvp/widgets/poppins_text.dart';
import 'package:mvp/widgets/primary_text.dart';
import 'package:mvp/widgets/secondary_text.dart';
import 'package:mvp/widgets/textfield.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({ super.key });

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List pages = [
    const Home(),
    const Projects(),
    const Home(),
    const Calendar(),
    const Account(),
  ];

  Widget newTask(){
    
    Widget dayContainer(text){
      return container(radius: Dimensions.radius30,
      border: Border.all(color: AppColors.greyLight),
      color: text == "Today"
      ? AppColors.darkBlack
      : AppColors.white,
      child: Padding(padding: EdgeInsets.all(Dimensions.padding10),
      child: primaryText(text: text, 
       color: text=="Today" ? AppColors.white : null,
        weight: FontWeight.w600,
        size: Dimensions.txt14,
        ),) );
    }

    Widget label(text){
      return secondaryText(text: text,
      color: AppColors.dropBorder,
      size: Dimensions.txt14,
      weight: FontWeight.w600
      );
    }

    Widget counter(){
      
      Widget minusOrPlus( n,  icon){
        return Container(
            width: Dimensions.height30,
          height: Dimensions.height30,
          decoration:  BoxDecoration(
            color: n == 2 ? AppColors.disabledGrey : AppColors.darkBlack,
            shape: BoxShape.circle),
            child: Icon(icon, size: Dimensions.txt18, color: AppColors.white,),
          );
      }

      return Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width40),
          child: container(radius: Dimensions.radius36,
          border: Border.all(color: AppColors.dropBorder),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                minusOrPlus( 2,  Icons.remove),
                poppinsText(text: "2", weight: FontWeight.w500, size: Dimensions.txt18),
                minusOrPlus( 3,  Icons.add),
              ],),)),
        ));
    }

    Widget datePick(){
      return Padding(
            padding:  EdgeInsets.only(left: Dimensions.height30 , right:  Dimensions.height30, top:  Dimensions.height30 ),
            child: SfDateRangePicker(
              
              backgroundColor: AppColors.white,
              todayHighlightColor: AppColors.darkBlack,
              showNavigationArrow: true,
              selectionColor: AppColors.darkBlack,
              monthViewSettings: const DateRangePickerMonthViewSettings(
              showTrailingAndLeadingDates: true,
            ),
              monthCellStyle: DateRangePickerMonthCellStyle(
                leadingDatesTextStyle: GoogleFonts.montserrat( 
                fontSize: Dimensions.txt15,
                fontWeight: FontWeight.w500,
               
              ),
              trailingDatesTextStyle: GoogleFonts.montserrat( 
                fontSize: Dimensions.txt15,
                fontWeight: FontWeight.w500,
                
              ),
                textStyle: GoogleFonts.montserrat( 
                fontSize: Dimensions.txt15,
                fontWeight: FontWeight.w500,
                color: AppColors.darkBlack
              ),
              ),
              selectionShape: DateRangePickerSelectionShape.rectangle,
              headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center, 
              
               backgroundColor: AppColors.white,
               textStyle: GoogleFonts.montserrat(
                fontSize: Dimensions.txt16,
                fontWeight: FontWeight.w500,
                color: AppColors.black2
               )),
            ),
          );
    }

    return Padding(
      padding:  EdgeInsets.all(Dimensions.height20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset("assets/icons/close.svg")),
          SizedBox(height: Dimensions.height15,),
          primaryText(text: "New Task",  weight: FontWeight.w700, size: Dimensions.txt16),
          SizedBox(height: Dimensions.height15,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
            dayContainer("Yesterday"),
            dayContainer("Today"),
            dayContainer("Tomorrow"),
            Consumer<BottomNavProvider>(
              builder: (BuildContext context, BottomNavProvider bottomProvider, Widget? child) { 
                return InkWell(
                onTap: () {
                  bottomProvider.setCalendarPressed(!bottomProvider.calendarPressed);
                },
                child: SvgPicture.asset("assets/icons/calendar1.svg"));
               },
              
            ),

          ],),
          Consumer<BottomNavProvider>(builder: (BuildContext context, BottomNavProvider bottomProvider, Widget? child) { 
            return bottomProvider.calendarPressed==true
          ? datePick() : container();
          }),
         
          SizedBox(height: Dimensions.height20,),
          label("Project"),
          SizedBox(height: Dimensions.height12,),
          dropDown(),
          SizedBox(height: Dimensions.height20,),
          label("Task"),
          SizedBox(height: Dimensions.height12,),
          dropDown(),
          SizedBox(height: Dimensions.height20,),
          label("Task Description"),
          SizedBox(height: Dimensions.height12,),
          textfield(hint: "Add Description..", 
           height: Dimensions.height90, maxLines: 6),
          SizedBox(height: Dimensions.height20,),
          label("Select hours"),
          SizedBox(height: Dimensions.height20,),
          counter(),
          SizedBox(height: Dimensions.height20,),
          label("Task Points"),
          SizedBox(height: Dimensions.height20,),
          counter(),
          SizedBox(height: Dimensions.height110,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: button(
              context: context,
              ontap: (){},
            text: "Create"),
          )




      ],),
    );
  }

  
  void onTap(int ind) {
    var provider=Provider.of<BottomNavProvider>(context, listen: false);
    provider.changeindex(ind);
    if(ind == 2){
      sshowModelBottomSheet(context, newTask(), 0.9,   );

    }
  }


    
  
  
   Widget bottomNavBar(){
     var provider=Provider.of<BottomNavProvider>(context, listen: false);

    BottomNavigationBarItem bottomNavBarItem(label, icon1, icon2, index){
      return BottomNavigationBarItem(
        backgroundColor: AppColors.white,
        icon: index == provider.index
        ? SvgPicture.asset(icon1)
        : SvgPicture.asset(icon2)//Icon(icon, )
        , label: label );
    }

    return Consumer<BottomNavProvider>(builder: (BuildContext context, BottomNavProvider provider, Widget? child) { 
      return  BottomNavigationBar(
      onTap: onTap,
      currentIndex: provider.index,
      backgroundColor: AppColors.white,
      unselectedItemColor: AppColors.unselectedLabel,
      selectedItemColor: AppColors.darkBlack,
      showUnselectedLabels: true,
      selectedLabelStyle: GoogleFonts.poppins(color: AppColors.darkBlack, fontWeight: FontWeight.w600, fontSize: Dimensions.txt10),
      unselectedLabelStyle: GoogleFonts.poppins(color: AppColors.unselectedLabel, fontWeight: FontWeight.w600, fontSize: Dimensions.txt10),
      items: [
        bottomNavBarItem("Home", "assets/icons/homeb.svg", "assets/icons/homeg.svg", 0
        
        ),
        bottomNavBarItem("Projects", "assets/icons/folderb.svg", "assets/icons/folderg.svg", 1

        ),
        BottomNavigationBarItem(icon: Container(
            width: Dimensions.height60,
          height: Dimensions.height60,
          decoration: const BoxDecoration(
            color: AppColors.darkBlack,
            shape: BoxShape.circle),
            child: Icon(Icons.add, size: Dimensions.txt32, color: AppColors.white,),
          ),
          label: ""),
        bottomNavBarItem("Time Line", "assets/icons/calendarb.svg", "assets/icons/calendarg.svg", 3
        
        ),
        bottomNavBarItem("Account", "assets/icons/accountb.svg", "assets/icons/accountg.svg", 4
        
        ),
      ]
      );
   
     },);
   
   }



  @override
  Widget build(BuildContext context) {
    
    return Consumer<BottomNavProvider>(builder: (BuildContext context, BottomNavProvider provider, Widget? child) { 
      return Scaffold(body: pages.elementAt(provider.index),
    bottomNavigationBar: bottomNavBar()
);
     },);
    
  }
}