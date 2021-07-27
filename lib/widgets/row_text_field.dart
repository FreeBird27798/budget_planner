import 'package:flutter/material.dart';

import 'budget_app_text.dart';

class RowTextField extends StatelessWidget {
  final TextEditingController textController;
  final String text;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLength;
  final void Function(String value)? onChanged;

  RowTextField({
    required this.textController,
    required this.text,
    required this.hintText,
    this.maxLength = 20,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BudgetAppText(
          text: text,
        ),
        Expanded(
          child: TextField(
            textAlign: TextAlign.end,
            keyboardType: keyboardType,
            controller: textController,
            maxLength: maxLength,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              counterText: '',
              hintText: hintText,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
