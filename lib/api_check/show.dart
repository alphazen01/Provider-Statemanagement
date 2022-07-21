// import 'package:demo/api_check/user_all_post_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ShowScreen extends StatefulWidget {
//   const ShowScreen({ Key? key }) : super(key: key);

//   @override
//   State<ShowScreen> createState() => _ShowScreenState();
// }

// class _ShowScreenState extends State<ShowScreen> {
//   TextEditingController _commentController = TextEditingController();
//   bool _isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:_isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             ):Column(
//               children: [
//                 Consumer<UserAllPostProvider>(
//                   builder: (BuildContext context, userAllPostProvider,  child) =>
//                   Text(userAllPostProvider.userallpost )
                 
//                 )
//               ],
//             ) ,
//     );
//   }
// }