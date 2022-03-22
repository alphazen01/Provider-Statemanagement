import 'package:demo/setting.dart';
import 'package:demo/setting_controller.dart';
import 'package:demo/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final themeController=Provider.of<ThemeController>(context);
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingScreen()));
                },
                title: Text(
                  "Setting",style: TextStyle(
                    fontSize:20
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            // Consumer<ThemeController>(
            //   builder: (context, value, child){
            //     return  Switch(
            //     value: themeController.isDark.value, 
            //     onChanged: (value){
            //       themeController.isDark.value=value;
            //       themeController.themeProvider(themeController.isDark.value);
            //     }
            //   );
            //   } ,
              
            // )
             Consumer<ThemeController>(
               builder: ((context, themeController, child){
                 return  Switch(
                 value: themeController.isDark, 
                 onChanged: (value){
                   if (value) {
                   themeController.setDarkTheme();  
                   }
                   else{
                     themeController.setLightTheme();
                   }
                   
                 },
                );
               }
             ),
             )
          ],
          centerTitle: true,
          title: Text("Provider"),
        ),
        body: Column(
          children: [
            Consumer<SettingController>(
              builder: (context,settingController,child){
                return Text(
                "The good news for Honda motorcycle users, fan-followers and well-wishers is that we have mentioned on this web page the current prices of Honda bikes or motorcycles in Bangladesh or BD, as well as the latest pictures and a brief description of each and every models which is currently available in Bangladesh.",
                style: TextStyle(
                  fontSize: settingController.sizeCounter.toDouble()==0.0?28:settingController.sizeCounter.toDouble()
                ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}