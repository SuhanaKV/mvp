import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/routes/route_helper.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/views/home_view/notification.dart';
import 'package:mvp/views/home_view/task_details.dart';
import 'package:mvp/widgets/box_shadow.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/poppins_text.dart';
import 'package:mvp/widgets/primary_text.dart';
import 'package:mvp/widgets/secondary_text.dart';
import 'package:mvp/widgets/serach.dart';


class Home extends StatefulWidget {
  const Home({ super.key });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  
  late TabController tabController;
  List iconList1=[Icons.play_circle, Icons.pause_circle];
  List iconList2=[Icons.check_circle, Icons.check_circle];
  bool historyPressed=false;
  var taskStatus=false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
   
    historyPressed=false;
    super.initState();
  }

  SliverAppBar appBar(){
      
      PreferredSizeWidget tabBar(){
        return TabBar(
                onTap: (value) {
                  if(value==1){
                    historyPressed=true;
                  }else{
                    historyPressed=false;
                  }
                },
                controller: tabController,
                indicatorColor: AppColors.darkBlack,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1.0,
                overlayColor: const WidgetStatePropertyAll(AppColors.white),
                labelStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.txt18,
                  color: AppColors.darkBlack
                ),
                tabs: const [ 
                  Tab(text: "Today",),
                  Tab(text: "History",)
              
                ]);
            
      }

      return SliverAppBar(
        floating: true,
        leading: container(),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        toolbarHeight: Dimensions.height70,
        
       
        actions:[ Expanded(
          child: Padding(
            padding:  EdgeInsets.only(left:  Dimensions.height20, right: Dimensions.height20, top: Dimensions.height20,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    secondaryText(text: "Good Morning, Kyle!", size: Dimensions.txt13 ),
                    primaryText(text: "Let’s Start your task", weight: FontWeight.w700),
                
                ],),
                const Spacer(),
                Stack(
                  children: [ 
                  Container(
                width: Dimensions.height50,
              height: Dimensions.height50,
              decoration: const BoxDecoration(
                color: AppColors.notificationBack,
                shape: BoxShape.circle),
                child: Padding(
                  padding:  EdgeInsets.all(Dimensions.height8),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteHelper.notification);
                    },
                    child: SvgPicture.asset("assets/icons/notification.svg"))
                )
              ),
              Positioned(
                top: 6,
                right: 10,
                child: Icon(Icons.circle, color: AppColors.notificationRed, size: Dimensions.txt13,))
                ],)
              ],
            ),
          ),
        ),],
        bottom: historyPressed==true
        ? PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, Dimensions.height110),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: search(),
              ),
              tabBar(),
            ],
          ),
        )
        : tabBar(),
        
      );
    }

    Widget tabList(iconList){
      
      Widget tabListItem(index){
        return InkWell(
          onTap: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  TaskDetails(
      iconList[index]==Icons.play_circle
      ? false : true)),
  ),
          child: container(
            color: AppColors.white,
            radius: Dimensions.radius12,
            shadow: [  boxShadow()
            
            
            ],
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.height18, bottom: Dimensions.height16, left: Dimensions.height16, right: Dimensions.height16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  container(radius: Dimensions.radius30,
                  color: AppColors.grey1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height6),
                    child: poppinsText(text: "UI ux Design",
                    weight: FontWeight.w500,
                    size: Dimensions.txt10),)
                  ),
                  SizedBox(height: Dimensions.height8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                        primaryText(text: "Design Task management App", size: Dimensions.txt14,
                      weight: FontWeight.w600, color: AppColors.black1),
                      SizedBox(height: Dimensions.height4,),
                      secondaryText(text: "Redesign fashion app for up dribble", color: AppColors.grey2)
                      ],),
                      
                      Icon(
                        iconList[index],
                      size: Dimensions.txt25,)
                  ],),
                  const Divider(thickness: 1, color: AppColors.divider,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                     primaryText(
                      text: taskStatus == 0
                        ? "Apr 20-2024 , 10:00 am"
                        : taskStatus == 1
                        ? "Apr 20-2024 , 10:00 am"
                        :  "Today, 10:00 am",
                      color: AppColors.grey2, size: Dimensions.txt13,
                     weight: FontWeight.w500),
                     primaryText(
                      text: "5 hours",
                      color: AppColors.grey2, size: Dimensions.txt13,
                     weight: FontWeight.w500)
                  ],)
          
              ],),) ),
        );
      }

      return Padding(
       padding:  EdgeInsets.symmetric(vertical: Dimensions.padding10, horizontal: Dimensions.padding10),
        child: ListView.separated(
          itemCount: iconList.length,
          itemBuilder: (context, index){
            return tabListItem(index);
          }, 
          separatorBuilder: (BuildContext context, int index) { 
            return SizedBox(height: Dimensions.padding10,);
           },),
      );
    }
   
 
  @override
  Widget build(BuildContext context) {

  
    return SafeArea(child: Scaffold( 
      backgroundColor: AppColors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, isScrolled){
          return [appBar()];
        }, 
        body:  TabBarView(
        controller: tabController,
        children: [
          tabList(iconList1),
          tabList(iconList2),
        ]),),
      /*appBar: appBar(),
      body: TabBarView(
        controller: tabController,
        children: [
          tabList(iconList1),
          tabList(iconList2),
        ]),*/
        
    ));
  }
}