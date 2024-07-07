
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ArticleList3 extends StatelessWidget {
//   static const String rn = "/ar3";

//   final int id;
//   const ArticleList3({
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
//             Get.toNamed('${ArticleList4.rn}?id=$futureId');
//           },
//         ),
//       ),
//     );
//   }
// }
