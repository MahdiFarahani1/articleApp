
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ArticleList2 extends StatelessWidget {
//   static const String rn = "/ar2";

//   final int id;
//   const ArticleList2({
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
//             Get.toNamed('${ArticleList3.rn}?id=$futureId');
//           },
//         ),
//       ),
//     );
//   }
// }