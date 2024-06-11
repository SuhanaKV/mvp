import 'package:flutter/material.dart';
import 'package:mvp/views/account/account.dart';
import 'package:mvp/views/authentication/login.dart';
import 'package:mvp/views/calendar/calendar.dart';
import 'package:mvp/views/home_view/bottom_navigation.dart';
import 'package:mvp/views/home_view/home.dart';
import 'package:mvp/views/home_view/notification.dart';
import 'package:mvp/views/projects/projects.dart';

class RouteHelper{
  static const String initial='/';
  static const String home='/home';
  static const String bottomNav='/bottomnav';
  static const String notification='/notification';
  static const String project='/project';
  static const String timeLine='/timeline';
  static const String account='/account';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case initial:
        return MaterialPageRoute(builder: (_)=>Login());
      case home:
        return MaterialPageRoute(builder: (_)=>Home());
      case bottomNav:
        return MaterialPageRoute(builder: (_)=>BottomNavigation());
      case notification:
        return MaterialPageRoute(builder: (_)=>NotificationPage());
      case project:
        return MaterialPageRoute(builder: (_)=>Projects());
      case timeLine:
        return MaterialPageRoute(builder: (_)=>Calendar());
      case account:
        return MaterialPageRoute(builder: (_)=>Account());
      default:
        throw FormatException("Route not found");
    }
  }

}