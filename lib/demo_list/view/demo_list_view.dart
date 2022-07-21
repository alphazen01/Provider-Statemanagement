

import 'package:demo/demo_list/controller/product_list_controller.dart';
import 'package:demo/demo_map/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DemoListHome extends StatefulWidget {
  const DemoListHome({Key? key}) : super(key: key);

  @override
  State<DemoListHome> createState() => _DemoListHomeState();
}

class _DemoListHomeState extends State<DemoListHome> {



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<ProductListController>(context, listen: false);
    WidgetsBinding.instance
    .addPostFrameCallback((_)=>data.productsListData(context));
  }



 Loading load = Loading();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
      body: Consumer<ProductListController>(
          builder: (context, productsListController, child) {
            if (productsListController.listDataState == ListDataState.loading) {
              return load.loader();
            } else if (productsListController.listDataState == ListDataState.loaded) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemCount: productsListController.productListModel.length,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Card(
                      color: Colors.yellow,
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Text(
                                   productsListController.productListModel[index].id.toString(),
                                style: TextStyle(
                                  fontSize: 18
                                ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Text(
                                  productsListController.productListModel[index].title.toString(),
                                  style: TextStyle(
                                    fontSize: 18
                                  ),
                                ),
                              ),
                            ],
                          ),
                         
                          // Text(productsList.products?[index].rating.toString()??"")
                        ],
                      ),
                    ),
                  );
                }),
              );
            } else {
              return Text('Something else');
            }
          },
        ),
      ),
    );
  }
}