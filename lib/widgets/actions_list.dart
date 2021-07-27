// import 'package:budget_planner/getx_controllers/action_getx_controller.dart';
// import 'package:budget_planner/utils/size_config.dart';
// import 'package:flutter/material.dart';
//
// import 'action_item.dart';
// import 'actions_date_text.dart';
//
// class ActionsList extends StatelessWidget {
//   final ActionGetxController controller;
//
//   ActionsList({required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) {
//         return Divider(
//           height: SizeConfig().scaleHeight(24),
//         );
//       },
//       padding: EdgeInsetsDirectional.zero,
//       itemCount: controller.actions.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             index == 0
//                 ? Column(
//                     children: [
//                       ActionDateText(
//                         date: controller.actions[index].date,
//                       ),
//                       SizedBox(
//                         height: SizeConfig().scaleHeight(20),
//                       ),
//                       ActionItem(
//                         action: controller.actions[index],
//                         controller: controller,
//                       ),
//                     ],
//                   )
//                 : Column(
//                     children: [
//                       Visibility(
//                         visible: controller.actions[index].date !=
//                             controller.actions[index - 1].date,
//                         child: ActionDateText(
//                           date: controller.actions[index].date,
//                         ),
//                       ),
//                       ActionItem(
//                         action: controller.actions[index],
//                         controller: controller,
//                       ),
//                     ],
//                   ),
//           ],
//         );
//       },
//     );
//   }
// }
