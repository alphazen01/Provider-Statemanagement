import 'package:demo/others/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingController=Provider.of<SettingController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<SettingController>(
              builder: (context, settingController, child){
                return Text(
                "The good news for Honda motorcycle users, fan-followers and well-wishers is that we have mentioned on this web page the current prices of Honda bikes or motorcycles in Bangladesh or BD, as well as the latest pictures and a brief description of each and every models which is currently available in Bangladesh.",
                style: TextStyle(
                  fontSize: settingController.sizeCounter.toDouble()==0?20:settingController.sizeCounter.toDouble()
                ),
                );
              },
    
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.purple,
                    child: IconButton(
                      onPressed: (){
                        settingController.increment();
                      }, 
                      icon: Icon(Icons.add)
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                 ClipOval(
                  child: Material(
                    color: Colors.purple,
                    child: IconButton(
                      onPressed: (){
                        settingController.decrement();
                      }, 
                      icon: Icon(Icons.remove)
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}