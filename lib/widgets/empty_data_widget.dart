import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  final String text;

  EmptyDataWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning, size: 80),
          BudgetAppText(
            text: text,
            textColor: Colors.grey.shade500,
            fontSize: 16,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
