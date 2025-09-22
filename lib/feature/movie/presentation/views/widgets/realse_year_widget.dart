
import 'package:flutter/material.dart';

class RealseYearWidget extends StatelessWidget {
  const RealseYearWidget({
    super.key,
    required this.realseYear,this.color=Colors.red
  });
final String realseYear;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(realseYear),
    );
  }
}
