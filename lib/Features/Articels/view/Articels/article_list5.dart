
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ArticleList5 extends StatelessWidget {
//   static const String rn = "/ar5";

//   final int id;
//   const ArticleList5({
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
//             Get.toNamed('${ArticleList2.rn}?id=$futureId');
//           },
//         ),
//       ),
//     );
//   }
// }
