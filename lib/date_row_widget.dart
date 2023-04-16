import 'package:flutter/material.dart';

class DateRow extends StatelessWidget {
  const DateRow({
    Key? key,
    required this.text, required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.date_range, size: 15, color: color,),
        const SizedBox(width: 5,),
        Text(text, style: TextStyle(color: color),)
      ],
    );
  }
}