import 'package:flutter/material.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/widgets/appbar.dart';
import 'package:mvp/widgets/project_item.dart';
import 'package:mvp/widgets/serach.dart';

class Projects extends StatefulWidget {
  const Projects({ super.key });

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  List<String> list1=["assets/images/profile1.jpeg", "assets/images/profile2.jpeg", "assets/images/profile3.jpeg","assets/images/profile4.png"];
  List<String> list2=["assets/images/profile1.jpeg", "assets/images/profile2.jpeg"];
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Projects"),
        body: SingleChildScrollView(child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:  Dimensions.padding16, vertical: Dimensions.height25),
          child: Column(
            children: [ 
            search(),
            Padding(
              padding:  EdgeInsets.only(top: Dimensions.height25),
              child: ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  if(index%2 ==0){
                    return ProjectItem(list1, index: index);
                  }else{
                    return ProjectItem(list2, index: index);
                  }
                }, 
                separatorBuilder: (context, index){
                  return SizedBox(height: Dimensions.height25,);
                }, 
                itemCount: 3),
            )
          ],),
        ),)
      ),
    );
  }
}