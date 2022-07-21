

import 'package:demo/demo/api_services/products_services.dart';



import 'package:demo/demo_map/controller/products_controller.dart';
import 'package:demo/demo_map/loading.dart';
import 'package:demo/demo_map/model/products_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DemoHome extends StatefulWidget {
  const DemoHome({Key? key}) : super(key: key);

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  String stringResponse = "";
  bool loading = false;

  ProductsrModel productsList = ProductsrModel();
  ApiServices apiServices = ApiServices();
  List listResponse = [];

  Future postsData() async {
    setState(() {
      loading = true;
    });
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        setState(() {
          productsList = productsrModelFromJson(response.body);

          print(productsList.total);
        });
      }
    } catch (e) {
      print(e);
    }
    loading = false;
  }

  //  Future productsData() async {
  //    setState(() {
  //     loading=true;
  //   });
  //   try {
  //     final response =
  //         await http.get(Uri.parse("https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9"));
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         productsList = productsrModelFromJson(response.body);

  //         print(productsList.total);
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   setState(() {
  //     loading=false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   postsData();
  // }
//   @override
//   void initState() {
//     super.initState();
//  productsData();
//   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<ProductsController>(context, listen: false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => data.productsData(context));
  }

  Loading load = Loading();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      //   itemCount: postLists.length,
      //   itemBuilder: ((context, index) {
      //     return Center(
      //       child: Row(
      //         children: [
      //           Text(postLists[index].title.toString()),
      //           // Image.network(productsList.products![index].images![0],scale: 10)
      //           // Text(productsList.products?[index].rating.toString()??"")
      //         ],
      //       ),
      //     );
      //   }),
      // ),
      //  body:
      //  loading?Center(child: CircularProgressIndicator()):
      //   ListView.builder(
      //   itemCount: productsList.products?.length,
      //   itemBuilder: ((context, index) {
      //     return Center(
      //       child: Row(
      //         children: [
      //           // Text(postLists[index].title.toString()),
      //         Image.network(productsList.products![index].images![0],scale: 10),
      //           Text(productsList.products?[index].title.toString()??"")
      //         ],
      //       ),
      //     );
      //   }),
      // ),
      body: Consumer<ProductsController>(
        builder: (context, productsController, child) {
          if (productsController.productDataState == DataState.loading) {
            return load.loader();
          } else if (productsController.productDataState == DataState.loaded) {
            return ListView.builder(
              itemCount: productsController.productsrModel.products!.length,
              itemBuilder: ((context, index) {
                return Center(
                  child: Column(
                    children: [
                      Text(productsController.productsrModel.products![index].title.toString()),
                      Image.network(productsController.productsrModel.products![index].thumbnail!,scale: 10)
                      // Text(productsList.products?[index].rating.toString()??"")
                    ],
                  ),
                );
              }),
            );
          } else {
            return Text('Something else');
          }
        },
      ),
    );
  }
}
