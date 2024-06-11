import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';


void sshowModelBottomSheet(BuildContext context, Widget child, double childSize, ){
  
  
  showModalBottomSheet(context: context, 
  backgroundColor: AppColors.white,
  isScrollControlled: true,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius8)) ),
  builder: (context){
   return  DraggableScrollableSheet(
      expand: false,
      initialChildSize: childSize,
      maxChildSize: childSize,
      minChildSize: childSize,
       builder: (context, scrollController){
        return SingleChildScrollView(
          
        child: child,);
       }
     
   );
  });
}