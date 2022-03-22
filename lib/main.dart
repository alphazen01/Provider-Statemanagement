import 'package:demo/home.dart';
import 'package:demo/setting_controller.dart';
import 'package:demo/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        
      
       )
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
        brightness:themeController.isDark?Brightness.dark:Brightness.light 
      ),
      themeMode: ThemeMode.system,
    
      home: HomeScreen(),
    
    );
  }
}

