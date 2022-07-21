import 'package:demo/api_check/timeline_page.dart';
import 'package:demo/api_check/user_all_post_provider.dart';
import 'package:demo/check/state/app_state.dart';
import 'package:demo/check/view/api_view.dart';
import 'package:demo/demo_list/controller/product_list_controller.dart';
import 'package:demo/demo_list/view/demo_list_view.dart';
import 'package:demo/demo_map/demo_home.dart';
import 'package:demo/others/setting_controller.dart';
import 'package:demo/others/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'demo_map/controller/products_controller.dart';
void main() {
  runApp(
     MyApp()
      
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
     providers: [
       ChangeNotifierProvider<SettingController>(
      create: (BuildContext context){
        return SettingController(
          
        );
      },
       ),
        ChangeNotifierProvider<ThemeController>(
      create: (context)=>ThemeController()
       ),
        ChangeNotifierProvider<ProductsController>(
      create: (context)=>ProductsController()
       ),
       ChangeNotifierProvider(
      create: (context) => AppState(),
       ),
        ChangeNotifierProvider<ProductListController>(
      create: (context)=>ProductListController()
       ),

     ],
      child:CustomApp(),
    );
  }
}

class CustomApp extends StatelessWidget {
  const CustomApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final themeController=Provider.of<ThemeController>(context);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness:themeController.isDark?Brightness.dark:Brightness.light,
        // fontFamily:fontsController.isTap? "Lobster" :"Edu TAS Beginner"
      ),
      themeMode: ThemeMode.system,
    
      home: DemoListHome(),
    
    );
  }
}

