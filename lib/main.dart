import 'package:flutter/material.dart';
import 'package:mvp/provider/bottom_nav_provider.dart';
import 'package:mvp/routes/route_helper.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/views/authentication/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( const MyApp()
     );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      
      providers: [
         ChangeNotifierProvider(create:  (context) => BottomNavProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white),
          bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.white,
         surfaceTintColor: AppColors.white)),
        home:  const Login(),
        initialRoute: RouteHelper.initial,
        onGenerateRoute: RouteHelper.generateRoute,
      ),
    );
  }
}

