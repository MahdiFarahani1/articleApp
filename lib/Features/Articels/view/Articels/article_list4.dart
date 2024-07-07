
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ArticleList4 extends StatelessWidget {
//   static const String rn = "/ar4";

//   final int id;
//   const ArticleList4({
//     super.key,
//     required this.id,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Scaffold(

//         body: FutureCommon.future(
//           context: context,
//           id: id,
//           pageBuilder: (futureId) {
//             Get.toNamed('${ArticleList5.rn}?id=$futureId');
//           },
//         ),
//       ),
//     );
//   }
// }
