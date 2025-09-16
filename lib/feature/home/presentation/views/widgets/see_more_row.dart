
import 'package:flutter/material.dart';

class SeeMoreRow extends StatelessWidget {
  const SeeMoreRow({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(children: [
        Text(text),
        Spacer(),
        Text("See More"),
        Icon(Icons.arrow_forward_ios,size: 16,)
      ],),
    );
  }
}

