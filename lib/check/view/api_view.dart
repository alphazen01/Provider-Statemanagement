import 'package:demo/check/model/req_model.dart';
import 'package:demo/check/state/app_state.dart';
import 'package:demo/check/util/api_services.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ApiView extends StatefulWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   final reqModel = Provider.of<AppState>(context,listen: false);
   reqModel.getPostData();
  
  }
   @override
  Widget build(BuildContext context) {
     final reqModel = Provider.of<AppState>(context);
        return Scaffold(
          body:Text(reqModel.post?.title??"") 
            
          
        );
    
  }
}