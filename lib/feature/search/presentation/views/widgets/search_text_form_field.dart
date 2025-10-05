
import 'package:flutter/material.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'search',
        prefixIcon: Icon(Icons.search, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white)
    
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
           borderSide: BorderSide(color: Colors.white)
        ),
      ),
    );
  }
}
