// import 'package:budget_planner/extenssions/app_colors_extenssion.dart';
// import 'package:budget_planner/utils/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class ScreenHeader extends StatelessWidget {
//   final String? imageName;
//   final String title;
//   final String info;
//
//   ScreenHeader({
//     this.imageName,
//     required this.title,
//     required this.info,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Visibility(
//           visible: imageName != null,
//           child: Container(
//             alignment: Alignment.center,
//             margin: EdgeInsetsDirectional.only(
//               bottom: SizeConfig().scaleHeight(13),
//             ),
//             width: SizeConfig().scaleWidth(120),
//             height: SizeConfig().scaleHeight(115),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(25),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 4),
//                   blurRadius: 4,
//                   spreadRadius: 0,
//                   color: Colors.black.withOpacity(0.25),
//                 )
//               ],
//             ),
//             child: SvgPicture.asset(
//               'images/$imageName.svg',
//               // 'images/app_icon.svg',
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         Text(
//           title,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: AppColors.app_primary,
//             fontSize: SizeConfig().scaleTextFont(20),
//           ),
//         ),
//         SizedBox(height: SizeConfig().scaleHeight(11)),
//         Text(
//           info,
//           // AppLocalizations.of(context)!.login_hint,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: AppColors.text_field_hint_color,
//             fontSize: SizeConfig().scaleTextFont(15),
//           ),
//         )
//       ],
//     );
//   }
// }
