import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvp/routes/route_helper.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';
import 'package:mvp/views/home_view/bottom_navigation.dart';
import 'package:mvp/widgets/button.dart';
import 'package:mvp/widgets/container.dart';
import 'package:mvp/widgets/primary_text.dart';
import 'package:mvp/widgets/secondary_text.dart';
import 'package:mvp/widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({ super.key });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark
    ));

    return SafeArea(child: Scaffold(
      body: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: SingleChildScrollView(child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.width40, vertical: Dimensions.height6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ container(
               width: 172.0,
               height: 87.0,
               child: Image.asset("assets/images/logo.png")),
               SizedBox(height: Dimensions.height110,),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  primaryText(text: "Welcome back", weight: FontWeight.w700, size: Dimensions.txt16, ),
                  SizedBox(height: Dimensions.height4,),
                  secondaryText(text: "Pleas Enter your email and password to login"),
                  SizedBox(height: Dimensions.height20,),
                  textfield(hint: "Email address"),
                  SizedBox(height: Dimensions.height12,),
                  textfield(hint: "Passwoard", obscureText: true),
                  SizedBox(height: Dimensions.height42,),
                  button(
                    context: context,
                    ontap: () {
                    Navigator.of(context).pushNamed(RouteHelper.bottomNav);
                   }, text: "Login")
               ],)
               ],
            ),
          ) ,),
        ),
      ),
    ));
  }
}