import 'package:demo/api_check/user_all_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({ Key? key }) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}
TextEditingController _commentController = TextEditingController();
class _TimelinePageState extends State<TimelinePage> {
   bool _isinIt = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isinIt) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<UserAllPostProvider>(context, listen: false)
          .userAllPost()
          .then((value) => setState(() {
                _isLoading = false;
              }));
    }
    _isinIt = false;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Timeline"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Consumer<UserAllPostProvider>(
                  builder: (BuildContext context, provider, Widget? child) =>
                      Expanded(
                    child: ListView.builder(
                        itemCount: provider.userallpost.data.length,
                        // image.length,

                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Container(
                                    // child: Image.asset('assets/g.jpg'),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        image: DecorationImage(
                                            image: AssetImage("assets/men.png"),
                                            fit: BoxFit.cover),
                                        color: Colors.deepOrangeAccent,
                                        borderRadius:
                                            BorderRadius.circular(360)),
                                    height: screenHeight * 0.08,
                                    width: screenWidth * 0.17,
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            provider.userallpost.data[index]
                                                .userName,
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: screenWidth * 0.02),
                                        // Text(
                                        //     // "22 Feb 2022"
                                        //     DateFormat("dd mm yyy").format(
                                        //         provider.userallpost.data[index]
                                        //             .createdAt),
                                        //     style: TextStyle(
                                        //         fontSize: screenWidth * 0.03))
                                      ]),
                                ]),
                                SizedBox(height: screenWidth * 0.05),
                                if (provider
                                        .userallpost.data[index].description !=
                                    null)
                                  Row(
                                    children: [
                                      const Text(
                                        "Description: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(provider
                                          .userallpost.data[index].description),
                                    ],
                                  ),
                                // SizedBox(height: screenWidth * 0.04),
                                if (provider
                                        .userallpost.data[index].productName !=
                                    null)
                                  Row(
                                    children: [
                                      const Text(
                                        "Product Name: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(provider
                                          .userallpost.data[index].productName),
                                          
                                    ],
                                  ),
                                //
                                if (provider
                                        .userallpost.data[index].productTitle !=
                                    null)
                                  Row(
                                    children: [
                                      const Text(
                                        "Product Title: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(provider.userallpost.data[index]
                                          .productTitle),
                                    ],
                                  ),
                                //
                                if (provider
                                        .userallpost.data[index].productPrice !=
                                    null)
                                  Row(
                                    children: [
                                      const Text(
                                        "Product Price: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(provider.userallpost.data[index]
                                          .productPrice),
                                    ],
                                  ),
                                //
                                if (provider
                                        .userallpost.data[index].productSize !=
                                    null)
                                  Row(
                                    children: [
                                      const Text(
                                        "productSize: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(provider
                                          .userallpost.data[index].productSize),
                                    ],
                                  ),
                                SizedBox(height: screenWidth * 0.04),
                                Container(
                                  width: screenWidth,
                                  height: screenHeight * 0.20,
                                  decoration: BoxDecoration(
                                      // image: DecorationImage(
                                      //     image: AssetImage("assets/video.jpeg"), fit: BoxFit.cover),
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    provider.userallpost.data[index].photo,
                                    // "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",

                                    // image[index],
                                    fit: BoxFit.cover,
                                  ),
                                  //     CachedNetworkImage(
                                  //   imageUrl:
                                  //       provider.allproduct.data[index].productPhoto,
                                  //   placeholder: (context, url) {
                                  //     //return Image.asset('assets/images/placeholder.png');
                                  //     return Image.asset('assets/video.jpeg');
                                  //   },
                                  //   errorWidget: (context, url, error) =>
                                  //       const Icon(Icons.error),
                                  //   // height: 65,
                                  //   // width: 65,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                SizedBox(height: screenWidth * 0.04),
                                Row(children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("Like")),
                                  SizedBox(width: screenWidth * 0.02),
                                  Icon(Icons.favorite, color: Colors.red),
                                  SizedBox(width: screenWidth * 0.20),
                                  Text("Share",
                                      style: TextStyle(color: Colors.blue))
                                ]),
                                SizedBox(height: screenWidth * 0.05),
                                TextFormField(
                                  controller: _commentController,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      filled: true,
                                      // fillColor: allColor.textFieldColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              // color: allColor.containerColor
                                              )),
                                      // focusColor: allColor.containerColor,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 1, 1, 0),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              // color: allColor.containerColor
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: "write a comment",
                                      suffixIcon: Icon(
                                        Icons.send,
                                        color: Colors.blue,
                                      )),
                                ),
                                SizedBox(height: screenWidth * 0.10),
                                Divider(
                                  thickness: 2,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
    ));
  }
}

